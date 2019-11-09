# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Deepjyoti <deep.barman30@gmail.com>


pkgname=playx-git
_prjname="${pkgname%-git}"
pkgver() {
  cd "$_prjname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r324.f56e0bc
pkgrel=1

pkgdesc='Search and play songs from Youtube, Soundcloud, Spotify and more from your terminal'
arch=('any')
url="https://github.com/NISH1001/$_prjname"
license=('MIT')

depends=('python-selenium'
         'python-requests'
         'python-beautifulsoup4'
         'python-numpy'
         'mpv'
         'youtube-dl'
         'chromium')
makedepends=('git'
             'python-setuptools')

provides=("$_prjname")
conflicts=("$_prjname")
replaces=("python-$pkgname")

source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$_prjname"
    python setup.py build
}

package() {
    cd "$_prjname"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
    for n in {16,48,72,96,256,512}; do
        install -Dm644 "logo/$n logo.svg" \
                "$pkgdir/usr/share/icons/hicolor/${n}x$n/apps/playx.svg"
    done
    for f in logo/*{logotype,bg}.svg; do
        install -Dm644 "$f" \
                "$pkgdir/usr/share/pixmaps/playx_${f/ /-}"
    done
    install -Dm644 README.md example.playx playx.gif requirements.txt \
            -t"$pkgdir/usr/share/doc/$_prjname/"
    install -Dm644 LICENSE \
            -t"$pkgdir/usr/share/licenses/$_prjname/"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
