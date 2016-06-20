# Maintainer: thr <r at sledinmay dot com>
# Contributor: cruznick <cruznick@archlinux.us>
# Contributor: fsckd <fsckdaemon@gmail.com>

# Tunables: change y to n to disable
_mk_burg_emu=${_mk_burg_emu:-n}        # enable burg emu

pkgname=burg-bzr
pkgver=1844
pkgrel=6
pkgdesc="Brand-new Universal loadeR from GRUB"
url="http://code.google.com/p/burg/"
license=('GPL3')
arch=('i686' 'x86_64')
makedepends=('gcc47' 'bzr' 'python2')
depends=('ruby' 'gettext' 'freetype2' 'sdl')
optdepends=('os-prober: Detect other installed OSes' 'memtest86+: Memory tester' 'burg-themes: BURG Themes' 'burg-themes-extras: Extra BURG themes')
conflicts=('burg' 'burg-bios' 'burg-bzr' 'burg-emu')
provides=('burg' 'burg-bios' 'burg-bzr' 'burg-emu')
backup=('etc/default/burg' 'etc/burg.d/40_custom')
sha256sums=('SKIP'
            'e94ee55a1fa9cadb5d752c40df6060c0b5c6b42f6f69440d24642b483255b05a'
            '57fa4d1ab439a3e716cf60f5eda533969f8d4a46b6425e85f0529d1897897446'
            '31edd8578c337be2f02dae8a292b5c53d34b107ab255634698794f999a293506'
            '646d55a233706329ecc9b4b6d0eb0460e6d37b84ebbe3e15c3176cbd23bf075b')
source=('bzr+lp:burg' 'burg.default' 'arch-burg.patch' '60_memtest86+' 'update-burg')
install='burg.install'

_common_configure_opts="--host="${CARCH}-pc-linux-gnu" --program-prefix=""	\
	--prefix="/usr" --bindir="/usr/bin" --sbindir="/usr/bin" --mandir="/usr/share/man" \
	--infodir="/usr/share/info" --sysconfdir="/etc" --disable-werror"

_build_common() {
  # Archlinux changed default /usr/bin/python to 3.1.2
  # need to use /usr/bin/python2 instead
  sed -i 's|python|python2|' autogen.sh
    CC="gcc-4.7" CFLAGS="-march=native -O2 -pipe" ./autogen.sh
}

build() {
  cd "${srcdir}/burg"

  msg "Building burg...."
  # some random patches to facilitate automatic creation of grub.cfg
  patch -Np1 -i "$srcdir/arch-burg.patch"
  _build_common
    _bios_configure_opts="${_common_configure_opts} --with-platform=pc --disable-grub-emu-usb"
    CC="gcc-4.7" CFLAGS="-march=native -O2 -pipe" ./configure ${_bios_configure_opts}
    CC="gcc-4.7" CFLAGS="-march=native -O2 -pipe" make -j1
}

package() {
    cd "${srcdir}/burg"

    ## Fix bootloader write permissions
    sed -i '92s/o /w /g' 1*

    make DESTDIR="${pkgdir}/" install

    ## Delete deprecated burg-mkconfig helper file
    rm -f "${pkgdir}/usr/lib/burg/update-burg_lib" || true
    rm -rf "${pkgdir}/usr/share/burg" || true

  if [[ $_mk_burg_emu == y ]] ; then
    msg "Building burg-emu...."
    _build_dir emu
    _build_common
    configopts="$configopts --with-platform=emu --disable-grub-emu-usb"
    CC="gcc-4.7" ./configure $configopts
    CC="gcc-4.7" make -j1
    install -D -m0755 grub-emu "$pkgdir/bin/burg-emu"
    [[ $_rm_bld_dirs == y ]] && _build_dir -r emu
  fi

  # install /etc/default/burg (needed config file)
  install -D -m0644 "$srcdir/burg.default" "$pkgdir/etc/default/burg"
  # install update-burg script
  install -D -m0755 "$srcdir/update-burg" "$pkgdir/usr/bin/update-burg"
  # install memtest config detection
  install -D -m0755 "$srcdir/60_memtest86+" "$pkgdir/etc/burg.d/60_memtest86+"
}
