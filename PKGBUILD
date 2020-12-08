# Maintainer: somini <dev@somini.xyz>
_pkgname=nitter
pkgname=nitter-git
pkgver=latest
pkgrel=9
pkgdesc="Alternative Twitter front-end"
url="https://github.com/zedeus/nitter"
depends=('redis')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'nim' 'nimble' 'libsass')
backup=('etc/nitter.conf')
license=('AGPL3')
arch=('x86_64')
install=nitter.install
source=("$pkgname::git+$url.git#branch=master"
            "config.patch"
            "tmpfilesd.conf"
            "nitter.sh"
            "nitter.service"
            "nitter.install")
sha256sums=('SKIP'
            '827a028b78761593ac1f835eff87c8495c84689893ad6ff71f2edb4b484239d4'
            '832d2963389270332e50da95082d43babbe40124dc2d7177bb19eefac9586891'
            '79469c5cfeacf38c7469a2240ba5c19670ddaf757e6d1b5286206a18a0718487'
            '560d98833c56979cb6b5d187a827788dbbdff95871f957225604b58b15c1c219'
            '57eb0d0aa47416006f107df078221e64023881123e8ec961266029db9228af9d')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"

  # Tweak the configuration file
  patch -p1 <"$srcdir/config.patch"
}

build() {
    cd "${srcdir}/$pkgname"

    # Based on the Dockerfile
    nimble build -y -d:release
    strip -s nitter
    nimble scss
}

package() {
    # Create the cache directory
    install -D -m644 tmpfilesd.conf "$pkgdir/usr/lib/tmpfiles.d/nitter.conf"
    # SystemD service
    install -D -m644 nitter.service -t "$pkgdir/usr/lib/systemd/system"
    # Use a wrapper script as entrypoint
    install -D -m755 nitter.sh "$pkgdir/usr/bin/nitter"

    main_dir="$pkgdir/usr/share/nitter"
    install -dD "$main_dir"

    cd "${srcdir}/$pkgname"
    # Main EXE
    install -D -m755 nitter -t "$main_dir"
    # Patched Configuration File
    install -D -m600 nitter.conf -t "$pkgdir/etc"
    ## Link it on the "working" directory
    ln -sv "/etc/nitter.conf" "$main_dir/nitter.conf"
    # Public Folder
    cp -r --no-preserve=all public -t "$main_dir"
    # System User
    echo 'u nitter - "Nitter" /usr/share/nitter' | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
