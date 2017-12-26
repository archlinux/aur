# Maintainer: nroi <nroi@mailbox.org>
pkgname=cpcache-git
pkgver=r160.a298d16
pkgrel=1
pkgdesc="central pacman cache"
arch=('x86_64')
url='https://github.com/nroi/cpcache'
license=('MIT')
makedepends=('erlang-nox' 'elixir')
install="${pkgname%-git}.install"
backup=('etc/cpcache.toml')
source=('git+https://github.com/nroi/cpcache.git'
        'sysuser.conf'
        'cpcache.install'
        'cpcache.service'
)
sha256sums=('SKIP'
            '0098e749b19617c0f7d619d47a3bc3015bab62e9ad0916087502daff672fb309'
            '6bee3cc74af8ba471720cef805895d874b74f8ff9cdba096c517c03d21af77b8'
            '85c0e0bb6fe4c78c35481fd2f694e223b1d957b59fdc207dad0911bb59bfe765'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  TMP="$(mktemp -d)"
  cd "${srcdir}/${pkgname%-git}"
  HOME="$TMP" /usr/bin/mix local.hex --force
  HOME="$TMP" /usr/bin/mix local.rebar --force
  HOME="$TMP" /usr/bin/mix deps.get
  HOME="$TMP" MIX_ENV=prod /usr/bin/mix release --env=prod
  mkdir -p "${pkgdir}/usr/share/${pkgname%-git}"
  mkdir -p "${pkgdir}/var/lib/${pkgname%-git}"
  mkdir -p "${pkgdir}/etc/cpcache"
  cd "${pkgdir}/usr/share/${pkgname%-git}"
  tar xf "${srcdir}/${pkgname%-git}/_build/prod/rel/${pkgname%-git}/releases/0.1.0/${pkgname%-git}.tar.gz"
  ln -s "/var/lib/${pkgname%-git}" var
  install -Dm644 "${srcdir}/cpcache.service" "${pkgdir}/usr/lib/systemd/system/cpcache.service"
  install -Dm644 "${srcdir}/sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/cpcache.conf"
  install -Dm644 "${srcdir}/cpcache/conf/cpcache.toml" "${pkgdir}/etc/cpcache/cpcache.toml"
  rm -rf "$TMP"
}
