# Maintainer: nroi <nroi@mailbox.org>
pkgname=cpcache-git
pkgver=r61.4a3239c
pkgrel=1
pkgdesc="central pacman cache"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/nroi/cpcache'
license=('MIT')
makedepends=('erlang-nox' 'elixir')
depends=('inotify-tools')
install="${pkgname%-git}.install"
backup=('etc/cpcache.yaml')
source=('git+https://github.com/nroi/cpcache.git'
        'sysuser.conf'
        'cpcache.install'
        'cpcache.service'
)
sha256sums=('SKIP'
            '0098e749b19617c0f7d619d47a3bc3015bab62e9ad0916087502daff672fb309'
            '159eb7ffd4fc7b44aa15c122aeddf8d433297352def6f0bbfc6a15df25fd8dcb'
            '4dbfd2b7934438fdde9b182b5e455f04176865063c8943be06bdfdf82ce38529'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  /usr/bin/mix deps.get
  /usr/bin/mix release.init
  MIX_ENV=prod mix release --env=prod
  mkdir -p "${pkgdir}/usr/share/"
  mkdir -p "${pkgdir}/var/lib/${pkgname%-git}"
  ln -s "/var/lib/${pkgname%-git}" "${srcdir}/${pkgname%-git}/rel/${pkgname%-git}/var"
  cp -r rel/cpcache "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/cpcache.service" "${pkgdir}/usr/lib/systemd/system/cpcache.service"
  install -Dm644 "${srcdir}/sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/cpcache.conf"
  install -Dm644 "${srcdir}/cpcache/conf/cpcache.yaml" "${pkgdir}/etc/cpcache.yaml"
}
