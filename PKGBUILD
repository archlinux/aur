# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

pkgname="n8n"
pkgver=2.36.9
pkgrel=4
pkgdesc="Free and source-available fair-code licensed workflow automation tool. Easily automate tasks across different services."
arch=('x86_64')
url="https://n8n.io"
license=("custom:Sustainable Use License")
backup=("etc/default/${pkgname}")
# Check upstream nodejs version constraints with:
#   curl -s "https://registry.npmjs.org/n8n/${pkgver}" | jq -r '.engines.node'
# Current upstream constraint: ">=24.0.0"
depends=("nodejs>=24.0.0" "sqlite" "librdkafka")
makedepends=("npm" "curl" "node-gyp" "python")
options=('!debug' '!strip')
source=("${pkgname}.env"
"${pkgname}.service"
"${pkgname}.sysusers"
"${pkgname}.tmpfiles"
"${pkgname}.user.service")
sha256sums=('a165ca406286e5cbba4c34e0edd7510d854e753bf1458e0385784b30d7564f19'
            '9356600848545416c490e3d74aff8494946afca187dd409a9f768db7a364f9da'
            '6139ae944272cdc50715fd82a3c062ebf1b7fd73f7f789cba0d27f5a0436c688'
            'faa4145ec8723700c5f8f75ae2dd3d78c931597b67e200050b55fec9d73c3f06'
            '03cb79cddc04a0303be6d60ba2e7801106b6d4405d33953a2c508c5825c66a7c')

latestver() {
  gh api --paginate repos/n8n-io/n8n/releases --jq \
    '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
    sed -nE 's/^n8n@([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

build() {
  # Download the correct version after pkgver() has run
  curl -L -o "${srcdir}/${pkgname}-${pkgver}.tgz" "https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
}

package() {
  install -Dm644 "${pkgname}.env"          "${pkgdir}/etc/default/${pkgname}"
  install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  npm install --cache "${srcdir}/npm-cache" --prefix="${pkgdir}/usr" --global --ignore-scripts --allow-remote=all "${srcdir}/${pkgname}-${pkgver}.tgz"
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"

  # npm >=12 blocks install scripts, and it blocks them for `npm rebuild` too —
  # the one command whose entire purpose is running them — so every native addon
  # has to be built directly. The build otherwise still exits 0 and the missing
  # binding only shows up when a user hits it.
  #
  # Only sqlite3 is required. The rest are optional: they either accelerate a
  # pure-JS path or gate one feature, and they bind V8 APIs that move between
  # node majors, so a hard gate on them makes the whole package unbuildable on
  # the next node release. Build them best-effort and say so when one is skipped.

  # Required: without this n8n cannot open its default database and will not start.
  ( cd "${node_root}/node_modules/sqlite3" &&
    npm_config_nodedir=/usr node-gyp rebuild --release --sqlite=/usr &&
    compgen -G 'build/Release/*.node' >/dev/null )

  local addon
  ( cd "${node_root}/node_modules/@confluentinc/kafka-javascript" &&
    BUILD_LIBRDKAFKA=0 npm_config_nodedir=/usr node-gyp rebuild --release &&
    compgen -G 'build/Release/*.node' >/dev/null ) ||
    { rm -rf "${node_root}/node_modules/@confluentinc/kafka-javascript/build"
      echo "==> WARNING: kafka-javascript addon did not build; the Kafka nodes will be unavailable" >&2; }

  # ssh2 keeps its addon outside the package root and npm resolves several
  # copies. 1.17.0 added six v8::Context::GetIsolate() calls, an API node 26
  # removed, so that copy cannot compile there — and it is the one
  # ssh2-sftp-client pulls in, meaning the SFTP node loses its crypto
  # acceleration precisely where throughput matters. The isolate is used only to
  # register the constructors, so take it from the isolate directly. 1.17.0 is
  # upstream's latest and has no fix; drop this when a release does.
  while IFS= read -r addon; do
    if grep -q 'context->GetIsolate()' "${addon}/src/binding.cc"; then
      sed -i 's|v8::Isolate\* isolate = context->GetIsolate();|v8::Isolate* isolate = v8::Isolate::GetCurrent();|g' \
        "${addon}/src/binding.cc"
    fi
  done < <(find "${node_root}/node_modules" -type d -path '*/ssh2/lib/protocol/crypto')

  # Should a future node remove something else here, ssh2 falls back to its
  # pure-JS crypto: slower, complete, and not a reason to fail the package.
  while IFS= read -r addon; do
    ( cd "${addon}" && npm_config_nodedir=/usr node-gyp rebuild --release &&
      compgen -G 'build/Release/*.node' >/dev/null ) ||
      { rm -rf "${addon}/build"
        echo "==> WARNING: ssh2 crypto addon did not build; ssh2 falls back to pure-JS crypto" >&2; }
  done < <(find "${node_root}/node_modules" -type d -path '*/ssh2/lib/protocol/crypto')

  while IFS= read -r addon; do
    ( cd "${addon}" && node buildcheck.js > buildcheck.gypi &&
      npm_config_nodedir=/usr node-gyp rebuild --release &&
      compgen -G 'build/Release/*.node' >/dev/null ) ||
      { rm -rf "${addon}/build"
        echo "==> WARNING: cpu-features addon did not build; ssh2 skips its CPU probe" >&2; }
  done < <(find "${node_root}/node_modules" -type d -name cpu-features)

  find "${node_root}/node_modules" -type d -name obj.target -prune -exec rm -rf {} +

  node -e '
    const { createRequire } = require("node:module");
    const req = createRequire(process.argv[1] + "/");
    new (req("sqlite3").Database)(":memory:").close();
    console.log("sqlite3 binding exercised");
  ' "${node_root}"

  # Development files
  find "${node_root}" -name "*.ts" -delete 2>/dev/null || true
  find "${node_root}" -name "*.js.map" -delete 2>/dev/null || true

  # Directory-based prebuilds (isolated-vm puts .node under prebuilds/{platform}-{arch}/)
  find "${node_root}" -type d -name 'prebuilds' | while IFS= read -r pb; do
    find "$pb" -mindepth 1 -maxdepth 1 -type d ! -name 'linux-x64' -exec rm -rf {} +
  done

  # Multi-platform standalone executables (agent-browser ships all 7 platform binaries)
  find "${node_root}" -path '*/agent-browser/bin/agent-browser-*' \
    ! -name 'agent-browser-linux-x64' -delete

  # Platform-specific driver directories
  rm -rf "${node_root}/node_modules/selenium-webdriver/bin/"{macos,windows}

  # Filename-pattern non-native .node files
  find "${node_root}" -type f -name '*.node' \
    \( -name '*darwin*' -o -name '*win32*' -o -name '*win64*' -o -name '*win-*' \
       -o -name '*android*' -o -name '*freebsd*' \
       -o -name '*arm64*' -o -name '*armv7*' -o -name '*armhf*' -o -name '*linux-arm*' \) \
    -delete

  # Musl .node binaries (Arch is glibc)
  find "${node_root}" -type f -name '*.node' -name '*musl*' -delete

  # Old Node.js ABI versions (depends requires nodejs>=22 = ABI 127+)
  find "${node_root}" -type f -name '*.node' \
    \( -name '*abi108*' -o -name '*abi115*' -o -name '*-108.node' -o -name '*-115.node' \) -delete

  install -dm755 "${pkgdir}/usr/share/"{licenses,doc}"/${pkgname}"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "/usr/lib/node_modules/${pkgname}/README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
