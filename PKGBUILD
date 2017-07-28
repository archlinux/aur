# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Andreas Linz <alinz@klingt.net>
# Based on `caddy=all-features` by Eric Engestrom: https://aur.archlinux.org/packages/caddy-all-features/
# Enable Cross Origin Resource Sharing

pkgname=caddy-full-bin
_realname=caddy
pkgver=0.10.5
ghpkgrel=''
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform (All features enabled)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'armv6h')
url="https://caddyserver.com"
license=('Apache')
provides=('caddy')
conflicts=('caddy' 'caddy-git' 'caddy-all-features')
depends=('systemd>=229')
makedepends=('patch')
md5sums_i686=('3299fb968b90d7d2ddbb18d42e2b7fc1'
              'ce5f9e54ab24ce0598da6c909995be9a')
md5sums_x86_64=('ed76d4c2aaac5a61b93998d1d7577b99'
                'ce5f9e54ab24ce0598da6c909995be9a')
md5sums_armv7h=('ddd30c49dd61e049ed0a3c7ee0555c9c'
                'ce5f9e54ab24ce0598da6c909995be9a')
md5sums_aarch64=('ddd30c49dd61e049ed0a3c7ee0555c9c'
                 'ce5f9e54ab24ce0598da6c909995be9a')
md5sums_armv6h=('1bf9ade53a1d4c2dfc5c66fd2f7a4e21'
                'ce5f9e54ab24ce0598da6c909995be9a')
install='caddy-full-bin.install'

source_i686=("https://github.com/klingtnet/caddy-release-downloader/releases/download/${pkgver}${ghpkgrel}/caddy-all-plugins-${pkgver}${ghpkgrel}-386.tar.gz" "caddy-systemd-service.patch")
source_x86_64=("https://github.com/klingtnet/caddy-release-downloader/releases/download/${pkgver}${ghpkgrel}/caddy-all-plugins-${pkgver}${ghpkgrel}-amd64.tar.gz" "caddy-systemd-service.patch")
source_armv7h=("https://github.com/klingtnet/caddy-release-downloader/releases/download/${pkgver}${ghpkgrel}/caddy-all-plugins-${pkgver}${ghpkgrel}-arm7.tar.gz" "caddy-systemd-service.patch")
source_aarch64=("https://github.com/klingtnet/caddy-release-downloader/releases/download/${pkgver}${ghpkgrel}/caddy-all-plugins-${pkgver}${ghpkgrel}-arm7.tar.gz" "caddy-systemd-service.patch")
source_armv6h=("https://github.com/klingtnet/caddy-release-downloader/releases/download/${pkgver}${ghpkgrel}/caddy-all-plugins-${pkgver}${ghpkgrel}-arm6.tar.gz" "caddy-systemd-service.patch")

prepare() {
  msg2 "Patching systemd service file"
  patch -Np1 -i "${srcdir}/caddy-systemd-service.patch" "${srcdir}/init/linux-systemd/caddy.service"
}

package() {
  install -Dm755 "${srcdir}/caddy" "${pkgdir}/usr/bin/caddy"
  install -Dm644 "${srcdir}/init/linux-systemd/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
  install -Dm644 "${srcdir}/init/linux-systemd/README.md" "${pkgdir}/usr/share/doc/${_realname}/service.txt"
  install -Dm644 "${srcdir}/LICENSES.txt" "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
  install -Dm644 "${srcdir}/README.txt" "${pkgdir}/usr/share/doc/${_realgname}/README.md"
  cat <<HEREDOC
NOTE: The 'proxy_header' directive is deprectated and now called 'header_upstream'!
Use 'caddy -validate -conf=/path/to/config' to check your config BEFORE restarting the service!
For further details refer to the official release notes: https://github.com/mholt/caddy/releases/tag/v0.9.5
HEREDOC
}
