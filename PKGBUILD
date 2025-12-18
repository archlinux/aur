# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

pkgname="n8n"
pkgver=2.0.3
pkgrel=2
pkgdesc="Free and source-available fair-code licensed workflow automation tool. Easily automate tasks across different services."
arch=('x86_64')
url="https://n8n.io"
license=("custom:Sustainable Use License")
backup=("etc/default/${pkgname}")
# Check upstream nodejs version constraints with:
#   curl -s "https://registry.npmjs.org/n8n/${pkgver}" | jq -r '.engines.node'
# Example output: ">=20.19 <= 24.x" means nodejs>=20.19.0 and nodejs<25
depends=("nodejs>=20.19" "nodejs<25")
makedepends=("npm" "curl")
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
  # Fetch latest version from npm registry
  curl -s "https://registry.npmjs.org/${pkgname}" | jq -r '.["dist-tags"].latest'
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

  npm install --cache "${srcdir}/npm-cache" --prefix="${pkgdir}/usr" --global --ignore-scripts "${srcdir}/${pkgname}-${pkgver}.tgz"
  npm rebuild --cache "${srcdir}/npm-cache" --prefix="${pkgdir}/usr/lib/node_modules/${pkgname}" sqlite3

  # Basic cleanup - remove some development files
  find "${pkgdir}/usr/lib/node_modules/${pkgname}" -name "*.ts" -delete 2>/dev/null || true
  find "${pkgdir}/usr/lib/node_modules/${pkgname}" -name "*.js.map" -delete 2>/dev/null || true

  local stacktrace_dir="${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/@sentry-internal/node-native-stacktrace/lib"
  if [[ -d "${stacktrace_dir}" ]]; then
    # Remove platform builds we cannot strip on this architecture to avoid fakeroot/strip failures
    find "${stacktrace_dir}" -type f -name 'stack-trace-*.node' \
      \( -name '*darwin*' -o -name '*win32*' \) \
      -delete

    local keep_pattern=""
    case "${CARCH}" in
      x86_64)
        keep_pattern="linux-x64"
        ;;
      aarch64)
        keep_pattern="linux-arm64"
        ;;
    esac

    if [[ -n "${keep_pattern}" ]]; then
      find "${stacktrace_dir}" -type f -name 'stack-trace-*.node' ! -name "*${keep_pattern}*" -delete
    fi
  fi

  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"
  if [[ -d "${node_root}" ]]; then
    find "${node_root}" -type f -name '*.node' \
      \( -name '*darwin*' -o -name '*win32*' -o -name '*win64*' -o -name '*win-*' -o -name '*android*' -o -name '*freebsd*' -o -name '*arm64*' -o -name '*armv7*' -o -name '*armhf*' -o -name '*linux-arm*' -o -name '*-musl*' \) \
      -delete
  fi

  install -dm755 "${pkgdir}/usr/share/"{licenses,doc}"/${pkgname}"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "/usr/lib/node_modules/${pkgname}/README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
