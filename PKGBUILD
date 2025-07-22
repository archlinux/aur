# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=pacredir-git
pkgname=(pacredir-git pacredir-avahi-git)
pkgver=0.7.3.r0.gd4f4b48
pkgrel=1
pkgdesc='redirect pacman requests, assisted by mDNS service discovery - git checkout'
arch=('x86_64')
url='https://github.com/eworm-de/pacredir'
license=('GPL-3.0-or-later')
makedepends=('coreutils'
             'curl'
             'discount'
             'git'
             'iniparser'
             'libmicrohttpd'
             'librsvg'
             'oxipng'
             'sh'
             'systemd')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183') # Christian Hesse <mail@eworm.de>
source=('git+https://github.com/eworm-de/pacredir.git')
sha256sums=('SKIP')

pkgver() {
	cd pacredir/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
  cd pacredir/

  make VERSION="${pkgver}-${pkgrel}"
}

package_pacredir-git() {
  depends=('curl' 'libcurl.so'
           'darkhttpd'
           'iniparser' 'libiniparser.so'
           'libmicrohttpd' 'libmicrohttpd.so'
           'sh'
           'systemd-libs' 'libsystemd.so')
  optdepends=('pacredir-avahi-git: compatibility for avahi-daemon')
  install=pacredir.install
  backup=('etc/pacman.d/pacredir'
          'etc/pacredir.conf'
          'etc/pacserve.conf'
          'etc/systemd/resolved.conf.d//01-pacredir-MulticastDNS-yes.conf')
  provides=('pacredir')
  conflicts=('pacredir')

  cd pacredir/

  make DESTDIR="${pkgdir}" install
}

package_pacredir-avahi-git() {
  pkgdesc='redirect pacman requests, assisted by mDNS service discovery, avahi compatibility - git checkout'
  depends=('pacredir-git' 'avahi')
  backup=('etc/systemd/resolved.conf.d/02-pacredir-avahi-MulticastDNS-resolve.conf')
  provides=('pacredir-avahi')
  conflicts=('pacredir-avahi')

  cd pacredir/

  make DESTDIR="${pkgdir}" install-avahi
}
