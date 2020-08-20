# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Konrad <konrad AT knauber DOT name>

pkgname=pinta
pkgver=1.7
pkgrel=1
pkgdesc="Drawing/editing program modeled after Paint.NET. It's goal is to provide a simplified alternative to GIMP for casual users"
arch=(any)
url="https://pinta-project.com/"
license=(MIT)
depends=(gtk-sharp-2 mono-addins)
makedepends=(intltool)
source=("https://github.com/PintaProject/Pinta/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        pinta.appdata.xml)
sha256sums=('678c0d5c6e41da77696180efc71476ccfda3238a3d68d7331198c8a431dbf96c'
            '7873caf68d056369a25185d2f61f108b30b1f42173f4bafa9ed0d4b5fe7e86de')

prepare() {
  cd "${pkgname}-${pkgver}"

  # update the project and solution files for mono4 (taken from Fedora)
  find . -name "*.sln" -print -exec sed -i 's/Format Version 10.00/Format Version 11.00/g' {} \;
  find . \( -name "*.csproj" -o -name "*.proj" \) -print -exec sed -i 's#ToolsVersion="3.5"#ToolsVersion="4.0"#g; s#<TargetFrameworkVersion>.*</TargetFrameworkVersion>##g; s#<PropertyGroup>#<PropertyGroup><TargetFrameworkVersion>v4.5</TargetFrameworkVersion>#g; s#Mono.Posix, Version.*"#Mono.Posix"#g' {} \;
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 ../pinta.appdata.xml "${pkgdir}/usr/share/metainfo/pinta.appdata.xml"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" license-*.txt readme.md
  rm -r "${pkgdir}/usr/share/pixmaps/"
}
