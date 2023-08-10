# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>

_pkgbase='systemd'
pkgname='efistub'
pkgdesc='UEFI files to use with UKI'
pkgver=254.1
pkgrel=1
arch=('x86_64')
url='https://www.github.com/systemd/systemd'
makedepends=('docbook-xsl' 'gperf' 'intltool' 'python-jinja' 'python-lxml' 'python-pyelftools' 'git' 'meson')
options=('strip')
source=("https://github.com/systemd/systemd-stable/archive/refs/tags/v$pkgver.zip")
sha512sums=('f8d82c38641456d90ce696f9d919ccccd887b05a740538f45a93319a6cddd59798a971902ddf3d5754fa35c5e82166385448696d3e254f1497c5e077a795da19')

_targets=(
	kernel-install
	man/kernel-install.8
	src/boot/efi/linuxx64.efi.stub
  )
# 
# prepare() {
  # cd "$_pkgbase-stable-$pkgver"
  # sed -i 's/if want_ossfuzz + want_libfuzzer > 1/if want_ossfuzz and want_libfuzzer/g' meson.build
  # git apply ../249-libshared-static.patch
# }

build() {
  local _meson_options=(
    # internal version comparison is incompatible with pacman:
    #   249~rc1 < 249 < 249.1 < 249rc
    -Dmode=release
    -Dblkid=true
    -Defi=true

	#-Dukify=true
	-Dtpm=true
    -Dkernel-install=true

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
    -Dsbat-distro-summary='Arch Linux'
    -Dsbat-distro-pkgname="${pkgname}"
    -Dsbat-distro-version="${pkgver}"
    -Dsbat-distro-url="https://archlinux.org/packages/core/x86_64/${pkgname}/"
  )

  arch-meson "$_pkgbase-stable-$pkgver" build "${_meson_options[@]}"
  ninja -C build -- "${_targets[@]}"
}

package() {
  #install -Dm755 build/bootctl "$pkgdir/usr/bin/bootctl"
  install -Dm755 build/kernel-install "$pkgdir/usr/bin/kernel-install"

  install -d "$pkgdir/usr/share/man/8" #{1,8}
  #cp build/man/bootctl.1 "$pkgdir/usr/share/man1"
  cp build/man/kernel-install.8 "$pkgdir/usr/share/man8"

  install -d "$pkgdir/usr/lib/systemd/boot/efi"
  cp build/src/boot/efi/linuxx64.{efi,elf}.stub "$pkgdir/usr/lib/systemd/boot/efi" # ,systemd-bootx64.{efi,elf}}

  cd "$_pkgbase-stable-$pkgver"

  install -d "$pkgdir/usr/lib/kernel/install.d"
  cp src/kernel-install/*.install "$pkgdir/usr/lib/kernel/install.d"
}
