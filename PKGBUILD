# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>

_pkgbase='systemd'
pkgname='efistub'
pkgdesc='UEFI files to use with UKI'
pkgver=255.4
pkgrel=1
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
makedepends=('docbook-xsl' 'gperf' 'intltool' 'python-jinja' 'python-lxml' 'python-pyelftools' 'git' 'meson')
options=('strip')
source=("https://github.com/systemd/systemd-stable/archive/refs/tags/v$pkgver.zip")
b2sums=('2f6585c951a0ac6554b34faaa3724547bb6932d17f26940b6c657bc789b91e4931014ccdb29913b5d092c7b1ef5fa71daea9b8045300b478746bb07f51829665')

build() {
  local _meson_options=(
    # internal version comparison is incompatible with pacman:
    #   249~rc1 < 249 < 249.1 < 249rc
    -Dmode=release
    -Dblkid=true
    -Defi=true
	-Dtpm=true

    -Dkernel-install=false
   	-Dukify=false

	-Dlink-boot-shared=false
	-Dlink-udev-shared=false
    -Drootprefix="/"

	# Disable all optional features
		-Dacl=false
		-Dadm-group=false
		-Danalyze=false
		-Dapparmor=false
		-Daudit=false
		-Dbacklight=false
		-Dbinfmt=false
		-Dbpf-framework=false
		-Dbzip2=false
		-Dcoredump=false
		-Ddbus=false
		-Delfutils=false
		-Denvironment-d=false
		-Dfdisk=false
		-Dgcrypt=false
		-Dglib=false
		-Dgshadow=false
		-Dgnutls=false
		-Dhibernate=false
		-Dhostnamed=false
		-Didn=false
		-Dima=false
		-Dinitrd=false
		-Dfirstboot=false
		-Dldconfig=false
		-Dlibcryptsetup=false
		-Dlibcurl=false
		-Dlibfido2=false
		-Dlibidn=false
		-Dlibidn2=false
		-Dlibiptc=false
		-Dlocaled=false
		-Dlogind=false
		-Dlz4=false
		-Dmachined=false
		-Dmicrohttpd=false
		-Dnetworkd=false
		-Dnscd=false
		-Dnss-myhostname=false
		-Dnss-resolve=false
		-Dnss-systemd=false
		-Doomd=false
		-Dopenssl=false
		-Dp11kit=false
		-Dpam=false
		-Dpcre2=false
		-Dpolkit=false
		-Dportabled=false
		-Dpstore=false
		-Dpwquality=false
		-Drandomseed=false
		-Dresolve=false
		-Drfkill=false
		-Dseccomp=false
		-Dsmack=false
		-Dsysext=false
		-Dtimedated=false
		-Dtimesyncd=false
		-Dqrencode=false
		-Dquotacheck=false
		-Duserdb=false
		-Dutmp=false
		-Dvconsole=false
		-Dwheel-group=false
		-Dxdg-autostart=false
		-Dxkbcommon=false
		-Dxz=false
		-Dzlib=false
		-Dzstd=false

    -Dsbat-distro='arch'
    -Dsbat-distro-pkgname="${pkgname}"
    -Dsbat-distro-version="${pkgver}"
  )

  arch-meson "$_pkgbase-stable-$pkgver" build "${_meson_options[@]}"
  ninja -C build -- src/boot/efi/linuxx64.efi.stub
}

package() {
  install -d "$pkgdir/usr/lib/systemd/boot/efi"
  cp build/src/boot/efi/linuxx64.{efi,elf}.stub "$pkgdir/usr/lib/systemd/boot/efi"
}
