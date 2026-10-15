# Maintainer: pngdeity <pngdeity@tutanota.com>
_githubname="apple/pkl-lsp"
_pkgname=pkl-lsp

pkgname=$_pkgname
pkgver=0.7.1
pkgrel=5
pkgdesc="Language Server Protocol implementation for Pkl"
arch=('x86_64' 'aarch64')
url="https://github.com/apple/pkl-lsp"
license=('Apache-2.0')
makedepends=('git' 'python')
depends=('glibc' 'zlib')

_graalvm_ver=25.4.4.1.1
_graalvm_dir=graalvm-community-jdk-25i4-25.0.4.1.1
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "LICENSE.txt::https://raw.githubusercontent.com/${_githubname}/${pkgver}/LICENSE.txt"
  "RunLspAgent.java"
  "merge-lsp4j-metadata.py"
)
source_x86_64=(
  "graalvm-jdk-${_graalvm_ver}-x64.tar.gz::https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${_graalvm_ver}/${_graalvm_dir}_linux-x64_bin.tar.gz"
)
source_aarch64=(
  "graalvm-jdk-${_graalvm_ver}-arm64.tar.gz::https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${_graalvm_ver}/${_graalvm_dir}_linux-aarch64_bin.tar.gz"
)
sha512sums=('88fa02a73aaf99169df900ee9e300f52ad0b86f52ca4f82b54d1d1fc9fd9053af5d0a9af35cee34c112ec6aa7a99dfc77d944ce5a5ae723845ae2a11750f078d'
            '98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8'
            'b2a669ba1b7345fc213e32d75cd47f63ff593fdb3397d4260c4fdfede2a08cc3c98e9345215e344e941659462b1176d9a76575f2e4b0fea564b9a89e1618b1ca'
            'b915b4bae6577f3e88cb7b4aed5fe18b9f85061fac4821d3e04bac8b88d468ed7f28960dcd60fa1830910a3aae917c537506d78edeea276af69e2bf4a61f056e')
sha512sums_x86_64=('9ab0e2c8b0e60742e0dd976205258f460534998afce6ab3becfbff275a257b0c960a9296c8039175f00447f6139ad434009ce4dfd226719ffcb7dd4130a87970')
sha512sums_aarch64=('a2796f1fcfab0d59b43ffe125a46aeb5409a058ffd1fcd28cf2b923c0cb7ce3977bc067627950da0d4cd9452c20c661da35940696331f24739caaf567adf7f98')

prepare() {
  mkdir -p "${srcdir}/graalvm-jdk"

  if [[ "${CARCH}" == "x86_64" ]]; then
    bsdtar --strip-components=1 -xzf "graalvm-jdk-${_graalvm_ver}-x64.tar.gz" -C "${srcdir}/graalvm-jdk"
  else
    bsdtar --strip-components=1 -xzf "graalvm-jdk-${_graalvm_ver}-arm64.tar.gz" -C "${srcdir}/graalvm-jdk"
  fi

  if [[ ! -x "${srcdir}/graalvm-jdk/bin/native-image" ]]; then
    echo "::error::native-image not found in GraalVM JDK"
    exit 1
  fi
}

build() {
  export SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-$(date +%s)}"
  export JAVA_HOME="${srcdir}/graalvm-jdk"
  export GRAALVM_HOME="${JAVA_HOME}"
  export PATH="${JAVA_HOME}/bin:${PATH}"
  export _JAVA_OPTIONS="-Xmx2g"
  export JDK_JAVA_OPTIONS=""

  cd "${srcdir}/${pkgname}-${pkgver}"

  ./gradlew --no-daemon --console=plain --build-cache shadowJar -x verifyShadowJar

  local JAR=$(find build/libs -name "pkl-lsp-${pkgver}*.jar" ! -name "*-sources*" ! -name "*-javadoc*" -print -quit)

  if [[ -z "${JAR}" ]]; then
    echo "::error::shadow JAR not found"
    echo "Contents of build/libs:"
    ls -la build/libs/
    exit 1
  fi

  if ! jar tf "${JAR}" | grep -q '\.pkl$'; then
    echo "::warning::shadow JAR contains no .pkl stdlib files — Pkl stdlib will be unavailable at runtime"
  fi

  local METADATA_DIR=build/agent-metadata
  local AGENT_JSON="${METADATA_DIR}/reachability-metadata.json"

  mkdir -p "${METADATA_DIR}"

  # The shadow JAR is a fat JAR: it already carries pkl-lsp, lsp4j, gson,
  # kotlin-reflect and jtreesitter, so it is the runtime classpath. (Upstream
  # 0.7.1 predates PR #226 and exposes no classpath-printing Gradle task.)
  javac -cp "${JAR}" -d build/agent-classes "${srcdir}/RunLspAgent.java"

  java \
    "-agentlib:native-image-agent=config-output-dir=${METADATA_DIR}" \
    -cp "build/agent-classes:${JAR}" \
    RunLspAgent "$(mktemp -d /tmp/pkl-lsp-agent-XXXXXX)"

  if [[ ! -f "${AGENT_JSON}" ]]; then
    echo "::error::tracing agent produced no ${AGENT_JSON}"
    exit 1
  fi

  python3 "${srcdir}/merge-lsp4j-metadata.py" "${AGENT_JSON}" "${JAR}" "${METADATA_DIR}/merged-reachability-metadata.json" || {
    echo "::error::lsp4j reflection metadata merge failed"
    exit 1
  }

  # native-image only scans META-INF/native-image/<group>/<artifact>/*.json; a
  # file placed as a direct child of META-INF/native-image/ is silently ignored.
  local STAGE_DIR="${srcdir}/jar-metadata"
  mkdir -p "${STAGE_DIR}/META-INF/native-image/${pkgname}/${pkgname}"
  cp "${METADATA_DIR}/merged-reachability-metadata.json" \
    "${STAGE_DIR}/META-INF/native-image/${pkgname}/${pkgname}/reachability-metadata.json"

  jar --file "${JAR}" -u -C "${STAGE_DIR}" "META-INF/native-image/${pkgname}/${pkgname}/reachability-metadata.json"

  # Verify the update actually landed inside the archive. `jar` cannot extract to
  # stdout, `unzip` is not available in a clean chroot, and `jar --extract` exits
  # 0 even when it matches nothing, so the check must be for the file on disk.
  local VERIFY_DIR="${srcdir}/jar-verify"
  rm -rf "${VERIFY_DIR}"
  mkdir -p "${VERIFY_DIR}"
  jar --extract --file "${JAR}" --dir "${VERIFY_DIR}" \
    "META-INF/native-image/${pkgname}/${pkgname}/reachability-metadata.json"

  local VERIFY_JSON="${VERIFY_DIR}/META-INF/native-image/${pkgname}/${pkgname}/reachability-metadata.json"

  if [[ ! -f "${VERIFY_JSON}" ]]; then
    echo "::error::merged reflection metadata was not injected into the JAR"
    exit 1
  fi

  if ! grep -q '"proxy"' "${VERIFY_JSON}"; then
    echo "::error::injected reflection metadata contains no proxy entries"
    exit 1
  fi

  export _JAVA_OPTIONS="-Xmx6g"

  native-image \
    -J--enable-native-access=ALL-UNNAMED \
    -march=compatibility \
    --enable-url-protocols=https,http \
    --enable-native-access=ALL-UNNAMED \
    -H:+ReportExceptionStackTraces \
    -H:NativeLinkerOption=-Wl,-z,relro,-z,now \
    -H:+UnlockExperimentalVMOptions \
    -H:+StripDebugInfo \
    -H:-UnlockExperimentalVMOptions \
    -R:MaxHeapSize=1g \
    --enable-sbom=false \
    -jar "${JAR}" \
    -o "${pkgname}"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./${pkgname} --version | grep -q "^${pkgname} version "
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
