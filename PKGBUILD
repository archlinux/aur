# Maintainer: nroi <nroi@mailbox.org>
pkgname=cpcache-git
pkgver=r95.974c568
pkgrel=1
pkgdesc="central pacman cache"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/nroi/cpcache'
license=('MIT')
makedepends=('erlang-nox' 'elixir')
depends=('waitforfile')
install="${pkgname%-git}.install"
backup=('etc/cpcache.yaml')
source=('git+https://github.com/nroi/cpcache.git'
        'sysuser.conf'
        'cpcache.install'
        'cpcache.service'
        'create_db.sh'
)
sha256sums=('SKIP'
            '0098e749b19617c0f7d619d47a3bc3015bab62e9ad0916087502daff672fb309'
            'effdcc6de465d342f4aba039c853d48e501cf0e55ed4f896cf638ba3499584f6'
            '0523a85ce955f9a221340a2bcd8b3f2543dc817469e36623db06630bea925918'
            '42c01be8766d2b48f142a7b848d5708035b80143af8f0bb02e69a3bc7fff3825'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/var/cache/cpcache/mnesia"
  ./create_db.sh "${pkgdir}"
  cd "${srcdir}/${pkgname%-git}"
  /usr/bin/mix local.hex --force
  /usr/bin/mix local.rebar --force
  /usr/bin/mix deps.get
  MIX_ENV=prod /usr/bin/mix release --env=prod
  mkdir -p "${pkgdir}/usr/share/${pkgname%-git}"
  mkdir -p "${pkgdir}/var/lib/${pkgname%-git}"
  cd "${pkgdir}/usr/share/${pkgname%-git}"
  tar xf "${srcdir}/${pkgname%-git}/_build/prod/rel/${pkgname%-git}/releases/0.1.0/${pkgname%-git}.tar.gz"
  ln -s "/var/lib/${pkgname%-git}" var
  install -Dm644 "${srcdir}/cpcache.service" "${pkgdir}/usr/lib/systemd/system/cpcache.service"
  install -Dm644 "${srcdir}/sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/cpcache.conf"
  install -Dm644 "${srcdir}/cpcache/conf/cpcache.yaml" "${pkgdir}/etc/cpcache.yaml"
}
