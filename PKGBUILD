# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

_pkgname=popcorntime
pkgname="${_pkgname}-git"
pkgver=0.4.4.r0.g0c54b2cd
pkgrel=1
pkgdesc='Popcorn Time is a multi-platform, free software BitTorrent client that includes an integrated media player.'
arch=(i686 x86_64)
url=https://github.com/popcorn-official/popcorn-desktop
license=(GPL3)
depends=(gtk3 libxss nss nodejs)
makedepends=(git yarn)
provides=(popcorntime)
conflicts=(popcorntime popcorntime-bin popcorntime-bin-ci)
options=(!emptydirs !strip)
source=("$_pkgname"::git+https://github.com/popcorn-official/popcorn-desktop#branch=development
        popcorntime.desktop)
sha512sums=('SKIP'
            '81a447cd3365b439964c1b9eba14bcf31de05e62123ce032590ac2109a447c5db0306bf4c593fe30f075d2b3674a1611a81b7554e43acba152ef34652c819a33')

pkgver() {
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver()_function
  cd "$_pkgname"
  git describe $(git remote)/master --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export YARN_GLOBAL_FOLDER=/tmp/node_modules/
  cd "$_pkgname"
  cat > .yarnrc <<-EOF
	disable-self-update-check true
	prefix /tmp/yarn/
	yarn-offline-mirror "$YARN_GLOBAL_FOLDER"
	yarn-offline-mirror-pruning true
	--cache-folder /tmp/yarn-cache/
	--non-interactive true
	--quiet true
	--ignore-engines true
	--ignore-optionals true
EOF
  yarn && yarn build
}

# https://wiki.archlinux.org/index.php/creating_packages
package() {
  cd "$_pkgname"

  # create directories
  install --directory --mode=755 "$pkgdir"/usr/{share,bin}/

  # copy everything to pkgdir
  cp --archive build/Popcorn-Time/* "$pkgdir/usr/share/${_pkgname}"

  # link binary to /usr/bin/popcorntime
  ln --force --symbolic "../share/${_pkgname}/Popcorn-Time" "$pkgdir/usr/bin/${_pkgname}"

  install -D --mode=644 "$srcdir/popcorntime.desktop" --target-directory="$pkgdir/usr/share/applications"
  # https://specifications.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html#directory_layout
  install -D --mode=644 './src/app/images/icon.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/popcorntime.png"

  # fix permissions
  chmod 755 "$pkgdir/usr/bin/${_pkgname}"
}
