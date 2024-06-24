# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>

_pkgbase='systemd'
pkgname='efistub'
pkgdesc='UEFI files to use with UKI'
pkgver=256.1
pkgrel=1
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
makedepends=('docbook-xsl' 'gperf' 'intltool' 'python-jinja' 'python-lxml' 'python-pyelftools' 'git' 'meson')
options=('strip')
source=("https://github.com/systemd/systemd/archive/refs/tags/v$pkgver.zip")
b2sums=('c5e6a7dda4f1cf4bc21a8de67aa4ad9033c00ebc1f8ece90cb5dc1381ffaf8d6887b749944f3ebbb73c2a61aee5b1767ac86e21e3a5719916dffa95360aaf80c')

build() {
  local _meson_options=(
    -Dmode=release
    -Dblkid=disabled
    -Dbootloader=enabled
	-Dtpm=false

    -Dkernel-install=false
   	-Dukify=disabled

	-Dlink-boot-shared=true
	-Dlink-udev-shared=false

	# Disable all optional features
	-Dacl=disabled
	-Dadm-group=false
	-Danalyze=false
	-Dapparmor=disabled
		-Daudit=disabled
		-Dbacklight=false
	-Dbinfmt=false
	-Dbpf-framework=disabled
	-Dbzip2=disabled
	-Dcoredump=false
	-Ddbus=disabled
	-Delfutils=disabled
	-Denvironment-d=false
	-Dfdisk=disabled
	-Dgcrypt=disabled
	-Dglib=disabled
	-Dgshadow=false
	-Dgnutls=disabled
	-Dhibernate=false
	-Dhostnamed=false
	-Didn=false
	-Dima=false
	-Dinitrd=false
	-Dfirstboot=false
	-Dldconfig=false
	-Dlibcryptsetup=disabled
	-Dlibcurl=disabled
	-Dlibfido2=disabled
	-Dlibidn=disabled
	-Dlibidn2=disabled
	-Dlibiptc=disabled
	-Dlocaled=false
	-Dlogind=false
	-Dlz4=disabled
	-Dmachined=false
	-Dmicrohttpd=disabled
	-Dnetworkd=false
	-Dnscd=false
	-Dnss-myhostname=false
	-Dnss-resolve=disabled
	-Dnss-systemd=false
	-Doomd=false
	-Dopenssl=disabled
	-Dp11kit=disabled
	-Dpam=disabled
	-Dpcre2=disabled
	-Dpolkit=disabled
	-Dportabled=false
	-Dpstore=false
	-Dpwquality=disabled
	-Drandomseed=false
	-Dresolve=false
	-Drfkill=false
	-Dseccomp=disabled
	-Dsmack=false
	-Dsysext=false
	-Dtimedated=false
	-Dtimesyncd=false
	-Dqrencode=disabled
	-Dquotacheck=false
	-Duserdb=false
	-Dutmp=false
	-Dvconsole=false
	-Dwheel-group=false
	-Dxdg-autostart=false
	-Dxkbcommon=disabled
	-Dxz=disabled
	-Dzlib=disabled
	-Dzstd=disabled

    -Dsbat-distro='arch'
    -Dsbat-distro-pkgname="${pkgname}"
    -Dsbat-distro-version="${pkgver}"
  )

  meson setup "$_pkgbase-$pkgver" build "${_meson_options[@]}"
  ninja -C build -- src/boot/efi/linuxx64.efi.stub
}

package() {
  install -d "$pkgdir/usr/lib/elogind/boot/efi"
  cp build/src/boot/efi/linuxx64.{efi,elf}.stub "$pkgdir/usr/lib/elogind/boot/efi"
}
