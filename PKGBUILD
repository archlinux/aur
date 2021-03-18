# Maintainer: ReneganRonin <renegan.ronin@gmail.com>
_name=julia
pkgname=${_name}-trinity
pkgver=20210318
pkgrel=2
pkgdesc='High-level, high-performance, dynamic programming language - official binaries of Stable, RC, and Nightly'
arch=('x86_64')
provides=(julia-trinity)
depends=(cblas fftw hicolor-icon-theme libgit2 libunwind libutf8proc openblas
         suitesparse mbedtls openlibm pcre2 llvm10-libs)
makedepends=(cmake gcc-fortran gmp python llvm10)
conflicts=(julia julia-git julia-nightly-bin julia-bin julia-beta-bin)
url='https://julialang.org/'
licenses=('MIT')
source=("https://julialang-s3.julialang.org/bin/linux/x64/1.5/$_name-1.5.4-linux-x86_64.tar.gz"
        "https://julialang-s3.julialang.org/bin/linux/x64/1.6/$_name-1.6.0-rc3-linux-x86_64.tar.gz"
        "https://julialangnightlies-s3.julialang.org/bin/linux/x64/$_name-latest-linux64.tar.gz"
16x16.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/16.png
32x32.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/32.png
128x128.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/128.png
256x256.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/256.png
512x512.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/512.png)
noextract=(
"$_name-1.5.3-linux-x86_64.tar.gz"
"$_name-1.6.0-rc3-linux-x86_64.tar.gz"
"$_name-latest-linux64.tar.gz"
    )
sha256sums=('80dec351d1a593e8ad152636971a48d0c81bfcfab92c87f3604663616f1e8bc5'
            'd2e93e07d29fdc16c1efdebf16363c7f6afcae59b0b6b160d336ee93f9055d73'
            '8be485f9141f3227f69092e84be27d87f0231ea141780ec80ebf347a9fb0e53b'
            '85aff59221938dd83aa3808910fb455c64f3f0936604bfaad7b8d27c01e3a7ed'
            '0310782968fe0ba2910e8a4fc3920ab58c0b8f91c66a66f6cff82cd0d6d31612'
            'aab27b427cb21108d831f2d9ddc89ce0948f7e8cb82e4bb2dc1bc82c6676224f'
            '001f5fe2478572c69ddcf135d460fab18fc851723e529b056fd9b9852b47f3a5'
            '3994d4d59d46e2d226d59f372e5b68eb23e8dc074529e870796f1132f5df8a5b')
options=(!strip)

pkgver() {
  date +%Y%m%d
}

prepare() {
  mkdir -p julia-stable  # stable
  mkdir -p julia-rc  # release candidate
  mkdir -p julia-nightly  # for nightly
  tar -zxvf $_name-1.5.4-linux-x86_64.tar.gz -C julia-stable --strip-components=1  
  tar -zxvf $_name-1.6.0-rc3-linux-x86_64.tar.gz -C julia-rc --strip-components=1
  tar -zxvf $_name-latest-linux64.tar.gz -C julia-nightly --strip-components=1
}

package() {
	# Creating the necessary directories
	install -dm755 ${pkgdir}/usr
	install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/share/applications
	install -dm755 ${pkgdir}/usr/share/${pkgname}
	install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}/${_name}-stable
	install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}/${_name}-rc
	install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}/${_name}-nightly
	
	
	# Installing licenses
	install -Dm644 $srcdir/${_name}-stable/LICENSE.md \
		${pkgdir}/usr/share/licenses/${pkgname}/${_name}-stable/LICENSE.md
	install -Dm644 $srcdir/${_name}-rc/LICENSE.md \
		${pkgdir}/usr/share/licenses/${pkgname}/${_name}-rc/LICENSE.md
	install -Dm644 $srcdir/${_name}-nightly/LICENSE.md \
		${pkgdir}/usr/share/licenses/${pkgname}/${_name}-nightly/LICENSE.md	
		

	# Copying source directories to /usr/
  cp -rfv $srcdir/${_name}-stable ${pkgdir}/usr/share/${pkgname}/${_name}-stable
  cp -rfv $srcdir/${_name}-rc ${pkgdir}/usr/share/${pkgname}/${_name}-rc
  cp -rfv $srcdir/${_name}-nightly ${pkgdir}/usr/share/${pkgname}/${_name}-nightly
  	
  	
  # Symlinking and renaming binaries
	ln -sfv /usr/share/${pkgname}/${_name}-stable/bin/julia ${pkgdir}/usr/bin/julia-stable
	ln -sfv /usr/share/${pkgname}/${_name}-rc/bin/julia ${pkgdir}/usr/bin/julia-rc
	ln -sfv /usr/share/${pkgname}/${_name}-nightly/bin/julia ${pkgdir}/usr/bin/julia-nightly
	
	
	# Creating the desktop application shortcuts
	sed -i '2s/Julia/Julia\ Stable/g' ${pkgdir}/usr/share/${pkgname}/${_name}-stable/share/applications/julia.desktop
  sed -i '2s/Julia/Julia\ RC/g' ${pkgdir}/usr/share/${pkgname}/${_name}-rc/share/applications/julia.desktop
  sed -i '2s/Julia/Julia\ Nightly/g' ${pkgdir}/usr/share/${pkgname}/${_name}-nightly/share/applications/julia.desktop
  sed -i '4s/julia/julia-stable/g' ${pkgdir}/usr/share/${pkgname}/${_name}-stable/share/applications/julia.desktop
  sed -i '4s/julia/julia-rc/g' ${pkgdir}/usr/share/${pkgname}/${_name}-rc/share/applications/julia.desktop
  sed -i '4s/julia/julia-nightly/g' ${pkgdir}/usr/share/${pkgname}/${_name}-nightly/share/applications/julia.desktop
  ln -sfv /usr/share/${pkgname}/${_name}-stable/share/applications/julia.desktop ${pkgdir}/usr/share/applications/julia-stable.desktop
  ln -sfv /usr/share/${pkgname}/${_name}-rc/share/applications/julia.desktop ${pkgdir}/usr/share/applications/julia-rc.desktop
  ln -sfv /usr/share/${pkgname}/${_name}-nightly/share/applications/julia.desktop ${pkgdir}/usr/share/applications/julia-nightly.desktop
  	
  # Cleaning up and installing icons
  cp -rfv $srcdir/${_name}-stable/etc ${pkgdir}
  rm -rf $pkgdir/usr/share/icons/hicolor/scalable
  for i in 16 32 128 256 512
  do
    mkdir -p $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/
		install -Dm644 $srcdir/${i}x${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/julia.png
  done
}

