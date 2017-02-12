# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=mylar-git
pkgver=r828.3fa3cfe
pkgrel=1
pkgdesc="automated Comic Book downloader for use with SABnzbd, NZBGet and torrents"
arch=('i686' 'x86_64')
url="https://github.com/evilhero/mylar"
license=('GPL3')
groups=()
depends=('python2')
makedepends=('git')
provides=("mylar")
conflicts=("mylar")
replaces=()
backup=()
options=()
install=mylar.install

source=('mylar-git::git+https://github.com/evilhero/mylar.git'
        'mylar.service'
        'mylar.sysusers'
)
noextract=()

sha256sums=('SKIP'
            '20c9b925222113afcdcdbe74a3ca8b6c805ffb42391fff9777c259b26a5b29da'
            '619a6266ad56e8363296b2ae7e2428c0f433f8c73a57d9bdf55ffba179f6c81d')

pkgver() {
  cd "$srcdir/${pkgname%-VCS}"

  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  # this would be in prepare() but prepare is run before pkgver and that needs to not happen
  cd "$srcdir/$pkgname"

  rm -rf "$srcdir/$pkgname/.git" # remove unneeded git info
  rm README.md # not needed
  rm API_REFERENCE # look it up on github if you want to use it

  cd "$pkgdir"
  # copy stuff over
  mkdir -p "$pkgdir/usr/share/"
  cp -r "$srcdir/mylar-git/" "$pkgdir/usr/share/mylar/"
  rm -rf "$pkgdir/usr/share/mylar/.git"

  # fix permissions
  chmod -R 755 "$pkgdir/usr/share/mylar"

  # install everything else
  install -D -m644 "${srcdir}/mylar.service" "${pkgdir}/usr/lib/systemd/system/mylar.service"
  install -D -m644 "${srcdir}/mylar.sysusers" "${pkgdir}/usr/lib/sysusers.d/mylar.conf"
  mkdir -p "${pkgdir}/etc/mylar"
  mkdir -p "${pkgdir}/var/lib/mylar"
}
