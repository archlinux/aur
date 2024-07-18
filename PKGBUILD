# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=dbus-sharp
pkgver=0.8.1
pkgrel=4
pkgdesc="C# implementation of D-Bus"
arch=('any')
url="https://github.com/mono/dbus-sharp/"
license=('custom')
depends=('mono')
options=(!makeflags)
source=(https://github.com/mono/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/Microsoft/msbuild/releases/download/mono-hosted-msbuild-v0.03/mono_msbuild_d25dd923839404bd64cc63f420e75acf96fc75c4.zip)
sha256sums=('0866c001f2d6e01a6f1b4d080db08d25ba1422e34c7d03020e0e70f3de3a9859'
            '9e992cb8e5526024eeae1cd9dea7f32c0158c2c8d94c9a7a310a146f14eef417')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e 's/gmcs/mcs/g' -i configure
}

build() {
  local msbuild="$srcdir/msbuild/MSBuild.exe"

  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
  mono $msbuild src/dbus-sharp.csproj /p:WarningLevel=0;Configuration=Release
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
