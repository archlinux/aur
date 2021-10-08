# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>

_pkgbase='systemd'
pkgname='nosystemd-boot'
pkgdesc='UEFI boot manager from systemd (formerly gummiboot) - patched to work without systemd'
_tag='91ea8d825553fc1ecfc19448be24a4da56b13d00' # git rev-parse v${_tag_name}
_tag_name=249.4
pkgver="${_tag_name/-/}"
pkgrel=2
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
makedepends=('docbook-xsl' 'gperf' 'intltool' 'python-jinja' 'python-lxml' 'gnu-efi-libs' 'git' 'meson')
options=('strip')
validpgpkeys=('63CDA1E5D3FC22B998D20DD6327F26951A015CC4'  # Lennart Poettering <lennart@poettering.net>
              'A9EA9081724FFAE0484C35A1A81CEA22BC8C7E2E'  # Luca Boccassi <luca.boccassi@gmail.com>
              '5C251B5FC54EB2F80F407AAAC54CA336CFEB557E') # Zbigniew Jędrzejewski-Szmek <zbyszek@in.waw.pl>
source=("git+https://github.com/systemd/systemd-stable#tag=${_tag}?signed"
        "git+https://github.com/systemd/systemd#tag=v${_tag_name%.*}?signed"
        'https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-boot/systemd-boot/files/249-libshared-static.patch')
sha512sums=('SKIP'
            'SKIP'
	    '5bb94984cddc26f35bec6edd02c7574ebd851e45efe551454d4372174ba2bca86c92c7be71936ddce4c2792886395467354e976a6a1f6e1505e95ba464a9466f'
)


_efiarch=x64
_targets=(
    bootctl
    man/bootctl.1
    man/kernel-install.8
    "src/boot/efi/linux$_efiarch."{efi,elf}".stub"
    "src/boot/efi/systemd-boot$_efiarch.efi"
  )

prepare() {
  cd "$_pkgbase-stable"
  git apply ../249-libshared-static.patch
}

build() {
  local _meson_options=(
    # internal version comparison is incompatible with pacman:
    #   249~rc1 < 249 < 249.1 < 249rc
    -Dversion-tag="${_tag_name/-/\~}-${pkgrel}-arch"
    -Dmode=release
    -Dblkid=true
   -Defi=true
   -Dgnu-efi=true


   -Drootprefix="/"

   -Dacl=false
   -Dapparmor=false
   -Daudit=false
   -Dbzip2=false
   -Delfutils=false
   -Dgcrypt=false
   -Dgnutls=false
   -Dkmod=false
   -Dlibcryptsetup=false
   -Dlibcurl=false
   -Dlibidn=false
   -Dlibidn2=false
   -Dlibiptc=false
   -Dlz4=false
   -Dmicrohttpd=false
   -Dpam=false
   -Dqrencode=false
   -Dseccomp=false
   -Dselinux=false
   -Dxkbcommon=false
   -Dxz=false
   -Dp11kit=false

    -Dsbat-distro='arch'
    -Dsbat-distro-summary='Arch Linux'
    -Dsbat-distro-pkgname="${pkgname}"
    -Dsbat-distro-version="${pkgver}"
    -Dsbat-distro-url="https://archlinux.org/packages/core/x86_64/${pkgname}/"
  )

  #arch-
  meson "$_pkgbase-stable" build "${_meson_options[@]}"
  ninja -C build -- "${_targets[@]}"
}

package() {
  install -Dm755 build/bootctl "$pkgdir/usr/bin/bootctl"

  install -d "$pkgdir/usr/share/man"{1,8}
  cp build/man/bootctl.1 "$pkgdir/usr/share/man1"
  cp build/man/kernel-install.8 "$pkgdir/usr/share/man8"

  install -d "$pkgdir/usr/lib/systemd/boot/efi"
  cp build/src/boot/efi/{linux${_efiarch}.{efi,elf}.stub,systemd-boot${_efiarch}.efi}  "$pkgdir/usr/lib/systemd/boot/efi"

  cd "$_pkgbase-stable"

  install -Dm755 src/kernel-install/kernel-install "$pkgdir/usr/bin/kernel-install"

  install -d "$pkgdir/usr/lib/kernel/install.d"
  cp src/kernel-install/*.install "$pkgdir/usr/lib/kernel/install.d"
}

