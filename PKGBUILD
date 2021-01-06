# Maintainer: Elijah Gregg <lovetocode999@ctrl-c.club>
# Contributor: Alexandros Theodotou <alex@zrythm.org>
_pkgname=zrythm
pkgname=$_pkgname-git
pkgver=1.0.0.alpha.7.1.1.r.gb61d69ee9
pkgrel=1
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('gtk3' 'lilv' 'libx11' 'jack' 'libsndfile'
  'libyaml'  'libsamplerate' 'alsa-lib' 'fftw' 'ruby-sass')
makedepends=(
  'python' 'gettext' 'sed'
  'meson' 'ninja' 'help2man' 'python-sphinx'
  'ladspa' 'lv2' 'suil')
optdepends=('portaudio: portaudio backend'
            'qt5-base: for embedding qt5 plugin UIs')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git+https://git.zrythm.org/git/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    _tag=$(git tag --sort=v:refname | tail -n1 | sed 's/-/\./')
    printf '%s.r%s.g%s' "${_tag#v}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    meson build --prefix=/usr -Denable_tests=true -Duser_manual=true -Dmanpage=true
    ninja -C build
}

check() {
    cd "$srcdir/$_pkgname"
    ninja -C build test
}

package() {
    cd "$srcdir/$_pkgname"
    install -vDm 644 AUTHORS CONTRIBUTING.md CHANGELOG.md README.md THANKS TRANSLATORS \
        -t "${pkgdir}/usr/share/doc/${pkgname}/"
    DESTDIR="${pkgdir}/" ninja -C build install
}
