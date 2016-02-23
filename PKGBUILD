# Maintainer: der_ronny <ronnymichaelradke[at]web[dot]de>
# Co-Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=repetier-host
pkgver=1.6.1
pkgrel=1
pkgdesc="almost complete 3d-printing workflow"
url='http://www.repetier.com/'
arch=('x86_64' 'i686')
license=('custom')
depends=('desktop-file-utils' 'mono')
optdepends=('slic3r' 'skeinforge')
_pkgver="${pkgver//./_}"
source=("http://download.repetier.com/files/host/linux/repetierHostLinux_$_pkgver.tgz")
md5sums=('c07fab367995f16847fbeb167042e845')
install=$pkgname.install

build() {
  cd ${srcdir}/RepetierHost
  _dir=/usr/share/repetierHost
  _osbit=`uname -m`
  echo "System: ${_osbit}"

  if [ ${_osbit} = "i686" ]; then
    cp plugins/CuraEngine/CuraEngine32 plugins/CuraEngine/CuraEngine
  else
    cp plugins/CuraEngine/CuraEngine64 plugins/CuraEngine/CuraEngine
  fi
  chmod a+x plugins/CuraEngine/CuraEngine

  chmod a+rx ../RepetierHost
  chmod -R a+r *
  chmod -R a+x data

  g++ SetBaudrate.cpp -o SetBaudrate
}

package() {
  _dir=/usr/share/repetierHost
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/sh" > "$pkgdir"/usr/bin/repetierHost
  echo "cd ${_dir}" >> "$pkgdir"/usr/bin/repetierHost
  echo "mono RepetierHost.exe -home ${_dir}&" >> "$pkgdir"/usr/bin/repetierHost
  chmod 755 "$pkgdir"/usr/bin/repetierHost

  mkdir -p "$pkgdir/usr/share/applications"
  echo "[Desktop Entry]
Name=Repetier-Host
Exec=/usr/bin/mono $_dir/RepetierHost.exe -home $_dir
Type=Application
StartupNotify=true
Comment=Repetier-Host 3d printer host software
Path=$_dir
Icon=$_dir/repetier-logo.png
MimeType=application/sla;text/gcode;application/wavefront-obj;application/x-amf;
" > "$pkgdir"/usr/share/applications/repetier-RepetierHost.desktop

  mkdir -p "$pkgdir/$_dir"
  cd "$pkgdir/$_dir"
  cp -a "$srcdir"/RepetierHost/* .

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv Repetier-Host-licence.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  find -name '*.txt' -delete
  find -name '*.cpp' -delete
  find -name '*.sh' -delete
  find -name 'CuraEngine32' -delete
  find -name 'CuraEngine64' -delete
  find -name 'Thumbs.db' -delete
  find -name '.DS_Store' -delete
  find -name '*.application' -delete
  find -name 'repetierHost' -delete
  find -name '*.desktop' -delete
  find -name 'installDependencies*' -delete

}

