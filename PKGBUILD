# Maintainer: nroi <nroi@mailbox.org>
pkgname=cpcache-git
pkgver=r121.4160ba4
pkgrel=1
pkgdesc="central pacman cache"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/nroi/cpcache'
license=('MIT')
makedepends=('erlang-nox' 'elixir')
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
            'a6ce949fba102e2f0904622d1f0417be15eee01e76516f80af1aa36a6c8ea312'
            '88654887a0ad506491778d98dad79004529340e47534538ae2401649ffc94a1b'
            '6deb112ac11a43a65891f8dcfa6844ca91c4852b8091e354caeac6afd7e00319'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
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
  install -Dm755 "${srcdir}/create_db.sh" "${pkgdir}/usr/share/${pkgname%-git}/create_db.sh"
}
