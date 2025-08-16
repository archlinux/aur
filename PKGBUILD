# Maintainer: Robert L Box <robertbox514@gmail.com>
# Contributor: JokerBoy <jokerboy at punctweb dot com>

pkgname=ls++-git
pkgver=0.62.8.567ff82
pkgrel=1
epoch=1
pkgdesc='Colorized LS on steroids'
url='https://github.com/trapd00r/ls--/'
arch=('any')
license=('GPL2')
depends=('perl-term-extendedcolor') # File::LsColor must be installed manually from CPAN
makedepends=('git' 'cpanminus')
backup=('etc/ls++.conf')
options=('!emptydirs')
provides=('ls++')
conflicts=('ls++')
source=("git+https://github.com/trapd00r/ls--.git#commit=567ff82bfedd345ac3feb89d61b22f3d24726145")
sha256sums=('SKIP')

# Notes for users:
# File::LsColor is required but not in official repos:
#   sudo pacman -S cpanminus
#   sudo cpanm File::LsColor
# This ensures ls++ runs properly.

pkgver() {
    cd "$srcdir/ls--"

    # Get latest tag or fallback
    local _tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "0.0")
    _tag=${_tag#v}

    # Number of commits since tag
    local _commits=$(git rev-list "${_tag}"..HEAD --count 2>/dev/null || git rev-list HEAD --count)

    # Short hash of HEAD
    local _hash=$(git rev-parse --short HEAD)

    echo "${_tag}.${_commits}.${_hash}"
}

build() {
    cd "$srcdir/ls--"
    PERL_MM_USE_DEFAULT=1 \
    PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
    PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
    MODULEBUILDRC=/dev/null \
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/ls--"
    make PREFIX=/ DESTDIR="${pkgdir}" install

    # Install default config for backup
    install -Dm644 ls++.conf "${pkgdir}/etc/ls++.conf"
}

# vim: ts=2 sw=2 et:
