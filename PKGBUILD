# Maintainer: Philip Deljanov <philip dot deljanov at gmail dot com>
# Contributor: bohoomil <bohoomil at zoho dot com>

pkgname=fontconfig-infinality-remix
_basename=fontconfig
pkgdesc="A library for configuring and customizing font access, optimized for Infinality Remix."
url='http://www.fontconfig.org/release/'
license=('custom' 'MIT')
pkgver=2.13.91+24+g75eadca
pkgrel=2
arch=(i686 x86_64)
groups=('infinality-remix')

depends=('expat' 'freetype2')
makedepends=('git' 'autoconf-archive' 'gperf' 'python-lxml' 'python-six' 'docbook-utils' 'docbook-sgml'
             'perl-sgmls' 'texlive-formatsextra>=2017' 'lynx' 'json-c')

options=('libtool')

provides=("fontconfig=$pkgver")

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

# Arch official upstream version commit
_commit=75eadca26648abf69497691ff0f4c7803b9ff23c

# Infinality Remix fontconfig configuration version
_remixver=20191030

source=("git+https://anongit.freedesktop.org/git/fontconfig#commit=$_commit"
        fontconfig-infinality-remix-srcs-${_remixver}.tar.bz2
        fc-presets
        fc-cache-infinality-remix.hook
        0001-configure-${pkgver}.patch
        0002-configure-${pkgver}.ac.patch
        0003-Makefile-${pkgver}.in.patch
        0004-Makefile-${pkgver}.conf.d.patch
        0005-Makefile-${pkgver}.am.in.patch)

sha256sums=('SKIP'
            'f8c49b4ee86ad64b1d3df700a5c0b337e44f507bb7e7d264eb5eaf0040998ef2'
            '23f70387eec20761b8b89f7a312f2859e4bfedd07325f3a1de12f86cca094711'
            '94e7b03a32304604be2cf5568c02805ea1ac45eb68104de400ae7f370e3e598b'
            '45a1ea897f0c7687f4ba1d2c200b17145cc5246e4a82eaa33e09d1b843030cb7'
            '006a14e00017736813002034996b024bb7133bd3eeda6b7f74e4c2880b64031d'
            '7dfc5ba9b20e0326e6a3a880f18d58a7ed31f7af025627670f210ec109be1a81'
            'fd3487482109874d21c0e537284920392f93c4362b70a765de376c66654edec6'
            'f989fce1a1537f6e9ad42b8a2d1bb87a451af6b4fb80f9281f8773985ce85627')

pkgver() {
    cd fontconfig
    git describe --tags | sed 's/-/+/g'
}

# a nice page to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
prepare() {
    patches=(0001-configure-${pkgver}.patch
            0002-configure-${pkgver}.ac.patch
            0003-Makefile-${pkgver}.in.patch
            0004-Makefile-${pkgver}.conf.d.patch
            0005-Makefile-${pkgver}.am.in.patch)

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
