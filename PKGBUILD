# Maintainer: Philip Deljanov <philip dot deljanov at gmail dot com>
# Contributor: bohoomil <bohoomil at zoho dot com>

pkgname=fontconfig-infinality-remix
_basename=fontconfig
pkgdesc="A library for configuring and customizing font access, optimized for Infinality Remix."
url='http://www.fontconfig.org/release/'
license=('custom' 'MIT')
pkgver=2.13.1
pkgrel=2
arch=(i686 x86_64)
groups=('infinality-remix')

depends=('expat' 'freetype2')
makedepends=('gperf' 'python-lxml' 'python-six' 'git')
options=('libtool')

provides=('fontconfig=$pkgver' 'fontconfig-infinality-remix')

conflicts=('fontconfig'
            'fontconfig-infinality'
            'fontconfig-infinality-git'
            'fontconfig-infinality-ultimate'
            'fontconfig-infinality-ultimate-git'
            'fontconfig-iu-comp')

backup=('etc/fonts/fonts.conf'
        'etc/fonts/conf.avail.infinality/combi/30-metric-aliases-combi.conf'
        'etc/fonts/conf.avail.infinality/combi/37-repl-global-combi.conf'
        'etc/fonts/conf.avail.infinality/combi/60-latin-combi.conf'
        'etc/fonts/conf.avail.infinality/combi/65-non-latin-combi.conf'
        'etc/fonts/conf.avail.infinality/combi/66-aliases-wine-combi.conf'
        'etc/fonts/conf.avail.infinality/35-repl-custom.conf'
        'etc/fonts/conf.avail.infinality/38-repl-webfonts-custom.conf'
        'etc/fonts/conf.avail.infinality/97-selective-rendering-custom.conf')

install=fontconfig-infinality-remix.install

source=("git+https://anongit.freedesktop.org/git/fontconfig#tag=${pkgver}"
        fontconfig-infinality-remix-srcs-${pkgver}.tar.bz2
        fc-presets
        fc-cache-infinality-remix.hook
        0001-configure-${pkgver}.patch
        0002-configure-${pkgver}.ac.patch
        0003-Makefile-${pkgver}.in.patch
        0004-Makefile-${pkgver}.conf.d.patch
        0005-Makefile-${pkgver}.am.in.patch)

sha256sums=('SKIP'
            'f8c49b4ee86ad64b1d3df700a5c0b337e44f507bb7e7d264eb5eaf0040998ef2'
            'c291f3849369106c5005155b5b099459c86baf455cea0e080a76a3fdf8a8f4b7'
            '94e7b03a32304604be2cf5568c02805ea1ac45eb68104de400ae7f370e3e598b'
            '7a0597c3a926176b5c844aa15f3fc98007398eb24db336b059c30f1cec8510cf'
            'ba8815b38d5d6e307d2107966c8b2ce0d2d48212ab99b55a56c6d66621b705ce'
            '039f53ede54db124ab55bf084c22359bf31e667e18e0abf660ce4b450610ae49'
            '6d1296fa0d86b95b41017e0c424c1cffea85606edaf80ed5e1d52b1d21486e5d'
            '61d6c1ecd4516a4b836c0dea3e0f70a4703ca326ffc830e9c135f907c464cfae')

# a nice page to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
prepare() {

    patches=(0001-configure-${pkgver}.patch
            0002-configure-${pkgver}.ac.patch
            0003-Makefile-${pkgver}.in.patch
            0004-Makefile-${pkgver}.conf.d.patch
            0005-Makefile-${pkgver}.am.in.patch
            )

    # Copy the Infinality font configuration.
    cd "${_basename}-infinality-remix-srcs"
    cp -r conf/conf.d.infinality "${srcdir}/${_basename}/conf.d.infinality"

    cd "${srcdir}/${_basename}"
    NOCONFIGURE=1 ./autogen.sh

    # Infinality & other downstream patches
    for patch in "${patches[@]}"; do
        patch -Np1 -i ../${patch}
    done

    aclocal
    libtoolize -f
    automake -afi
}

build() {
    cd "${_basename}"

    ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-templatedir=/etc/fonts/conf.avail \
    --with-templateinfdir=/etc/fonts/conf.avail.infinality \
    --with-xmldir=/etc/fonts \
    --localstatedir=/var \
    --disable-static \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/share/fonts
    make
}

#check() {
#  cd "${_basename}"
#  make -k check
#}

package() {
    cd "${_basename}"
    make DESTDIR="${pkgdir}" install

    # Install license
    install -m755 -d "${pkgdir}"/usr/share/licenses/"${_basename}"
    install -m644 COPYING "${pkgdir}"/usr/share/licenses/"${_basename}"

    # Install fc-presets
    install -m755 "${srcdir}"/fc-presets "${pkgdir}"/usr/bin/"fc-presets"

    # ALPM/Pacman hook
    install -D -m 644 "${srcdir}"/fc-cache-infinality-remix.hook \
    "${pkgdir}/usr/share/libalpm/hooks/90-fc-cache-infinality-remix.hook"

    # Switch to Infinality Remix sources
    cd "${srcdir}"/"${_basename}-infinality-remix-srcs"

    # Copy the Infinality font configuration preset folders which the Makefile will not include in the package.
    cp -r conf/conf.d.infinality/{combi,free,ms,remix} "${pkgdir}"/etc/fonts/conf.avail.infinality

    # Copy extra documentation
    install -m755 -d "${pkgdir}"/usr/share/doc/"${pkgname}"
    cp -r doc/"${pkgname}" "${pkgdir}"/usr/share/doc/

    find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
