# Maintainer: nroi <nroi@mailbox.org>
pkgname=cpcache-git
pkgver=0.1.7.r0.g85e347d
pkgrel=1
pkgdesc="central pacman cache"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/nroi/cpcache'
license=('MIT')
makedepends=('erlang-nox' 'elixir')
install="${pkgname%-git}.install"
backup=('etc/cpcache/cpcache.toml')
source=('git+https://github.com/nroi/cpcache.git#tag=0.1.7'
        'sysuser.conf'
        'cpcache.install'
        'cpcache.service'
)
sha256sums=('SKIP'
            '0098e749b19617c0f7d619d47a3bc3015bab62e9ad0916087502daff672fb309'
            'c360324b57070f3e833ea1f0ed62cf1ccd09601fd9993a59792334779397df9d'
            '7f9ac6a73156119d1f1c7125dd5ce6ef8e5fdaa1a55f486d17462b7d3af0f812'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  TMP="$(mktemp -d)"
  cd "${srcdir}/${pkgname%-git}/cpcache"
  HOME="$TMP" /usr/bin/mix local.hex --force
  HOME="$TMP" /usr/bin/mix local.rebar --force
  HOME="$TMP" /usr/bin/mix deps.get
  HOME="$TMP" MIX_ENV=prod /usr/bin/mix release
  mkdir -p "${pkgdir}/usr/share/${pkgname%-git}"
  mkdir -p "${pkgdir}/var/lib/${pkgname%-git}"
  mkdir -p "${pkgdir}/etc/cpcache"
  cd "${pkgdir}/usr/share/${pkgname%-git}"
  mv "${srcdir}/${pkgname%-git}/cpcache/_build/prod/rel/${pkgname%-git}"/* .
  ln -s "/var/lib/${pkgname%-git}" var
  install -Dm644 "${srcdir}/cpcache.service" "${pkgdir}/usr/lib/systemd/system/cpcache.service"
  install -Dm644 "${srcdir}/sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/cpcache.conf"
  install -Dm644 "${srcdir}/cpcache/cpcache/conf/cpcache.toml" "${pkgdir}/etc/cpcache/cpcache.toml"
  rm -rf "$TMP"
}
