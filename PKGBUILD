# Maintainer: ReneganRonin <renegan.ronin@gmail.com>
_name=julia
pkgname=${_name}-trinity
pkgver=20210305
pkgrel=1
pkgdesc='High-level, high-performance, dynamic programming language - official binaries of Stable, RC, and Nightly'
arch=('x86_64')
provides=(julia-trinity)
depends=(cblas fftw hicolor-icon-theme libgit2 libunwind libutf8proc openblas
         suitesparse mbedtls openlibm pcre2 llvm10-libs)
makedepends=(cmake gcc-fortran gmp python llvm10)
conflicts=(julia julia-git julia-nightly-bin julia-bin julia-beta-bin)
url='https://julialang.org/'
licenses=('MIT')
source=("https://julialang-s3.julialang.org/bin/linux/x64/1.5/$_name-1.5.3-linux-x86_64.tar.gz"
        "https://julialang-s3.julialang.org/bin/linux/x64/1.6/$_name-1.6.0-rc1-linux-x86_64.tar.gz"
        "https://julialangnightlies-s3.julialang.org/bin/linux/x64/$_name-latest-linux64.tar.gz"
16x16.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/16.png
32x32.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/32.png
128x128.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/128.png
256x256.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/256.png
512x512.png::https://github.com/JuliaLang/julia/raw/master/contrib/mac/frameworkapp/JuliaLauncher/Assets.xcassets/AppIcon.appiconset/512.png)
noextract=(
"$_name-1.5.3-linux-x86_64.tar.gz"
"$_name-1.6.0-rc1-linux-x86_64.tar.gz"
"$_name-latest-linux64.tar.gz"
    )
sha256sums=('f190c938dd6fed97021953240523c9db448ec0a6760b574afd4e9924ab5615f1'
            '72847bd2b4d4db9d5970512f79fd5a7f76ad56cf0f2ea5a80eff032364b19c8b'
            '99067f2045669cf4fa0009216637d52c9155223cb511aff458f243bc6d11f06e'
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
  mkdir -p juliast  # stable
  mkdir -p juliarc  # release candidate
  mkdir -p juliant    # for nightly
  tar -zxvf $_name-1.5.3-linux-x86_64.tar.gz -C juliast --strip-components=1  
  tar -zxvf $_name-1.6.0-rc1-linux-x86_64.tar.gz -C juliarc --strip-components=1
  tar -zxvf $_name-latest-linux64.tar.gz -C juliant --strip-components=1
}

package() {

  mkdir -p ${pkgdir}/usr/bin/
  ln -s $srcdir/${_name}st/bin/julia ${pkgdir}/usr/bin/juliast
  ln -s $srcdir/${_name}rc/bin/julia ${pkgdir}/usr/bin/juliarc
  ln -s $srcdir/${_name}nt/bin/julia ${pkgdir}/usr/bin/juliant

  cd $srcdir/${_name}nt
  mkdir -p ${pkgdir}/usr/share/licenses/${_name}
  install -Dm644 LICENSE.md \
    ${pkgdir}/usr/share/licenses/${_name}/LICENSE.md

  sed -i '2s/Julia/Julia\ Stable/g' $srcdir/${_name}st/share/applications/julia.desktop
  sed -i '2s/Julia/Julia\ RC/g' $srcdir/${_name}rc/share/applications/julia.desktop
  sed -i '2s/Julia/Julia\ Nightly/g' $srcdir/${_name}nt/share/applications/julia.desktop
  sed -i '4s/julia/juliast/g' $srcdir/${_name}st/share/applications/julia.desktop
  sed -i '4s/julia/juliarc/g' $srcdir/${_name}rc/share/applications/julia.desktop
  sed -i '4s/julia/juliant/g' $srcdir/${_name}nt/share/applications/julia.desktop
  mv $srcdir/${_name}st/share/applications/julia.desktop $srcdir/${_name}st/share/applications/juliast.desktop
  mv $srcdir/${_name}rc/share/applications/julia.desktop $srcdir/${_name}st/share/applications/juliarc.desktop
  mv $srcdir/${_name}nt/share/applications/julia.desktop $srcdir/${_name}st/share/applications/juliant.desktop

  cp -r $srcdir/${_name}st/share/applications ${pkgdir}/usr/share/
  cp -r $srcdir/${_name}rc/share/applications ${pkgdir}/usr/share/
  cp -r $srcdir/${_name}nt/share/applications ${pkgdir}/usr/share/

  rm -rf $pkgdir/usr/share/icons/hicolor/scalable
  for i in 16 32 128 256 512
  do
    mkdir -p $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/
    install -Dm644 $srcdir/${i}x${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/julia.png
  done
}

