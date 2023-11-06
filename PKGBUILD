# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=secoclient
pkgver=7.0.12.1
pkgrel=1
pkgdesc="华为（HUAWEI）VPN client"
arch=('x86_64')
options=('!strip')
license=('custom')
source=(
  # 注意: 华为没有提供 secoclient 的下载地址，请手动下载 Linux 安装文件并放置在这里
  # NOTE: Huawei doesn't provide download url for secoclient. Please download it manually and place here.
  "local://secoclient-linux-64-$pkgver.run"
  'SecoClientPromoteService.service'
  'secoclient.install'
  'SecoClientPromoteService.sh'
)
sha256sums=('35a4bf2cf32b3aea134892b827922c38179d0641f211ed3a5aaf0dcbd8e0d068'
            'ff391fca9c33544f13861710706d770c1a0fa7608e370170a9729fe8c145370c'
            'c33781b0dbab7b27858a5338f59ce3d70506d35dca92cac576206c7015c0a81f'
            '54128f91f81818b0dbf49bcf127ffcb39c5489efd6a48249155a49774d0bc081')
install=secoclient.install

prepare() {
  file="$srcdir/secoclient-linux-64-$pkgver.run"
  lines=$(grep -aoP '(?<=^lines=)\d+' $file)
  tail -n +$lines $file > ./SecoClient.tar.gz
}

package() {
  CUR_DIR=$pkgdir/usr/local
  DESTDIR=${CUR_DIR}/SecoClient #destination directory to install V5R2UI
  CERT=${DESTDIR}/certificate
  mkdir -p $DESTDIR
  mkdir -p $CERT
  tar -xvf $srcdir/SecoClient.tar.gz -C $DESTDIR

  DESKTOP_FILE=${DESTDIR}/image/SecoClient.desktop
  EXEC_FILE="Exec=${DESTDIR#$pkgdir}/SecoClient"
  EXEC_PATH="Path=${DESTDIR#$pkgdir}"
  EXEC_ICON="Icon=${DESTDIR#$pkgdir}/image/ICON.ico"

  sed -i "5a\\$EXEC_FILE" $DESKTOP_FILE
  sed -i "6a\\$EXEC_PATH" $DESKTOP_FILE
  sed -i "7a\\$EXEC_ICON" $DESKTOP_FILE

  APPDIR="$pkgdir/usr/share/applications"
  APPSHORTCUT="$APPDIR/SecoClient.desktop"
  install -D -m 644 "$DESTDIR/image/SecoClient.desktop" "$APPSHORTCUT"

  install -D -m 644 'SecoClientPromoteService.service' $pkgdir/usr/lib/systemd/system/SecoClientPromoteService.service
  install -D -m 755 'SecoClientPromoteService.sh' "$DESTDIR/promote/SecoClientPromoteService.sh"
}
