# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributer: Morten Linderud <foxboron@archlinux.org>

_pkgname=pacman
pkgname=${_pkgname}-saltedcoffii
pkgver=6.0.2
_libalpm_ver=13.0.2
pkgrel=5.1
pkgdesc="A version of pacman specifically designed for use by saltedcoffii (me)." # See patches folder for more changes
arch=('x86_64')
url="https://www.archlinux.org/pacman/"
license=('GPL')
groups=('base-devel')
depends=('bash' 'glibc' 'libarchive' 'curl' 'gpgme' 'pacman-mirrorlist'
         'gettext' 'gawk' 'coreutils' 'gnupg' 'grep' 'makepkg-optimize')
makedepends=('meson' 'asciidoc' 'doxygen' 'samurai' 'base-devel')
checkdepends=('python' 'fakechroot')
optdepends=('perl-locale-gettext: translation support in makepkg-template'
            "pacman-static: just in case pacman breaks. Shouldn\'t happen but just in case!"
            'aria2: default download configuration in pacman.conf'
            'rsync: support for rsync mirrors'
            'pacman-contrib: community packages')
conflicts=('pacman')
provides=('libalpm.so=13.0.2' "pacman=${pkgver%.*.*}")
backup=(etc/pacman.conf
        etc/makepkg.conf)
options=('strip')
validpgpkeys=('6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'
              'B8151B117037781095514CA7BBDFFC92306B1121')
source=(https://sources.archlinux.org/other/pacman/"${_pkgname}-${pkgver}".tar.xz{,.sig}
        pacman-always-create-directories-from-debugedit.patch::https://gitlab.archlinux.org/pacman/pacman/-/commit/efd0c24c07b86be014a4edb5a8ece021b87e3900.patch
        pacman-always-create-directories-from-debugedit-fixup.patch::https://gitlab.archlinux.org/pacman/pacman/-/commit/86981383a2f4380bda26311831be94cdc743649b.patch
        pacman-fix-unique-source-paths.patch::https://gitlab.archlinux.org/pacman/pacman/-/commit/478af273dfe24ded197ec54ae977ddc3719d74a0.patch
        pacman-strip-include-o-files-similar-to-kernel-modules.patch::https://gitlab.archlinux.org/pacman/pacman/-/commit/de11824527ec4e2561e161ac40a5714ec943543c.patch
        pacman.conf
        makepkg.conf
        salted-patches.patch)
sha256sums=('7d8e3e8c5121aec0965df71f59bedf46052c6cf14f96365c4411ec3de0a4c1a5'
            'SKIP'
            '522b789e442b3bb3afa7ea3fa417a99554f36ec00de3986cbe92c80f09a7db99'
            'dab7c70fb9d77d702069bb57f5a12496b463d68ae20460fb0a3ffcb4791321a9'
            '0b56c61eac3d9425d68faa2eccbaefdc5ed422b643974ae829eaca0460043da1'
            'acd0b149b6324dc1eca3cd2d3b30df6ef64c5653e83523d77200ec593e01d2a7'
            'ff8380938f17e81d4ebb44ea2fc99484f8d363081cec865fa7893ebd47a94d68'
            '5aabae92d7b43edc8fb0ec8242932d10b683d507977ec5223f1527fc7efcb601'
            'f3b73e3fc6f8e87a94af274678b9ad7f152db086daaf947ec4f0b532e58dc161')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # we backport way too often in pacman
  # lets at least make it more convenient
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd "${_pkgname}-${pkgver}"

  meson --prefix=/usr \
        --buildtype=plain \
        -Ddoc=enabled \
        -Ddoxygen=enabled \
        -Dscriptlet-shell=/usr/bin/bash \
        -Dldconfig=/usr/bin/ldconfig \
        build

  samu -C build
}

check() {
  cd "${_pkgname}-${pkgver}"

  samu -C build test
}

package() {
  cd "${_pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" samu -C build install

  # install Arch specific stuff
  install -dm755 "$pkgdir/etc"
  install -m644 "$srcdir/pacman.conf" "$pkgdir/etc"
  install -m644 "$srcdir/makepkg.conf" "$pkgdir/etc"
}
