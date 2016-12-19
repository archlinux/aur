# Maintainer: nroi <nroi@mailbox.org>
pkgname=cpcache-git
pkgver=r66.80cd2f4
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
            'e326c1097269a47a35fe327d839a566d90888339f7cc00b2207e0accf441e6cd'
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
  MIX_ENV=prod /usr/bin/mix release --env=prod
  mkdir -p "${pkgdir}/usr/share/"
  mkdir -p "${pkgdir}/var/lib/${pkgname%-git}"
  ln -s "/var/lib/${pkgname%-git}" "${srcdir}/${pkgname%-git}/rel/${pkgname%-git}/var"
  cp -r rel/cpcache "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/cpcache.service" "${pkgdir}/usr/lib/systemd/system/cpcache.service"
  install -Dm644 "${srcdir}/sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/cpcache.conf"
  install -Dm644 "${srcdir}/cpcache/conf/cpcache.yaml" "${pkgdir}/etc/cpcache.yaml"
}
