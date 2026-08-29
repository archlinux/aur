# Maintainer: Autumn (Bee) <10378052+bee-san at users dot noreply dot github dot com>

pkgname=mangatan-extension-server
pkgver=1.0.6.3
pkgrel=1
pkgdesc="Headless Mihon extension server for Mangatan (Mihon bridge)"
# The JAR is byte-identical in the upstream Linux, macOS and Windows bundles and
# ships JNI natives for every architecture, so it is portable as-is.
arch=('any')
url="https://github.com/1Selxo/M-Extension-Server"
license=('MPL-2.0')

makedepends=('libarchive')
# Pin the runtime rather than using java-runtime>=21: only jre21-openjdk (or
# jdk21-openjdk, which provides it) guarantees the exact interpreter path linked
# below. A newer JVM satisfies java-runtime>=21 but installs elsewhere, which
# would leave that symlink dangling.
depends=('jre21-openjdk')

_bundle="${pkgname}-${pkgver}-bundle.zip"
_jar="MExtensionServer-v${pkgver}.jar"
_serverdir="usr/share/mangatan/extension_server"

source=(
  "${_bundle}::${url}/releases/download/v${pkgver}/linux-x64-bundle.zip"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/1Selxo/M-Extension-Server/v${pkgver}/LICENSE"
)
# Upstream publishes no standalone JAR asset, only the four ~135 MiB platform
# bundles. Skip the automatic extraction so the vendored JRE inside never lands
# on disk; prepare() pulls out the one file this package installs.
noextract=("${_bundle}")

sha256sums=(
  '4a8f4c3407de8b5b493f49b471748eafef324903486a63436c102bcaa912db44'
  '3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04'
)

prepare() {
  # bsdtar fails on a pattern that matches nothing, but a pattern matching two
  # entries would concatenate them into one corrupt file and still exit 0, so
  # require exactly one match before extracting rather than after.
  local matches
  matches=$(bsdtar --list --file "${_bundle}" 'MExtensionServer-*.jar' | wc -l)
  if (( matches != 1 )); then
    printf 'Expected exactly one MExtensionServer JAR in %s, matched %s\n' \
      "${_bundle}" "${matches}" >&2
    return 1
  fi

  # Renamed from the upstream MExtensionServer-v<ver>-r1.jar: Mangatan only
  # requires the MExtensionServer- prefix, the .jar suffix and a parseable
  # version in the basename, so dropping the build-number suffix keeps the
  # packaged name stable if upstream bumps it.
  bsdtar --extract --to-stdout --file "${_bundle}" 'MExtensionServer-*.jar' \
    > "${_jar}"

  if (( $(stat -c %s "${_jar}") < 10000000 )); then
    printf 'Extracted %s is implausibly small\n' "${_jar}" >&2
    return 1
  fi
}

package() {
  install -Dm644 "${srcdir}/${_jar}" "${pkgdir}/${_serverdir}/${_jar}"

  # Mangatan looks for the interpreter at exactly <root>/jre/jre/bin/java, the
  # layout of the upstream bundle it normally downloads. Linking the system JRE
  # there lets the app adopt this install with no folder picking, and keeps the
  # ~135 MiB vendored runtime out of the package.
  install -dm755 "${pkgdir}/${_serverdir}/jre/jre/bin"
  ln -s /usr/lib/jvm/java-21-openjdk/bin/java \
    "${pkgdir}/${_serverdir}/jre/jre/bin/java"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
