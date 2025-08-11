# Maintainer: DuckSoft <realducksoft at gmail dot com>
_name=outline-manager
pkgname=${_name}-appimage
pkgver=1.18.0
pkgrel=1
pkgdesc="Creates and manages Outline servers, powered by Shadowsocks."
arch=('x86_64')
url="https://github.com/Jigsaw-Code/outline-server"
license=('Apache')
makedepends=('git')
options=(!strip)
provides=(${_name})
conficts=(${_name})
# See https://github.com/Jigsaw-Code/outline-releases/blob/master/manager/latest-linux.yml
_app_image="Outline-Manager-v${pkgver}.AppImage"
_build_version=1
source=("${_app_image}::https://s3.amazonaws.com/outline-releases/manager/linux/${pkgver}/${_build_version}/Outline-Manager.AppImage")
sha256sums=(9f41c2697509ff6480775e482890654387b1c05fd4d14b0d88be56e057875582)

#######################################
# To get all available download links #
#######################################
# usage: bash -c '. PKGBUILD; get_version_links'
get_version_links() {
  docker run -i --entrypoint=python public.ecr.aws/lambda/python:3.12 <<EOF
from pprint import pprint
from boto3 import client
from botocore import UNSIGNED
from botocore.client import Config
s3c = client('s3',config=Config(signature_version=UNSIGNED))
pprint([o['Key'] for o in s3c.list_objects_v2(Bucket='outline-releases', Prefix='manager/linux')['Contents'] if o['Key'].endswith('.AppImage')])
EOF
}
#######################################

prepare() {
  chmod +x ${_app_image}
  ./${_app_image} --appimage-extract usr/share/icons/hicolor > /dev/null
  ./${_app_image} --appimage-extract '@outlineserver_manager.desktop' > /dev/null
  mv 'squashfs-root/@outlineserver_manager.desktop' "squashfs-root/${_name}.desktop"

  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_name}|"\
        "squashfs-root/${_name}.desktop"
}


package() {
 cd squashfs-root
 find "usr/share/icons/hicolor" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
 install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
 cd ${srcdir}

 install -Dm755 -t "$pkgdir/opt/${_name}/" "$srcdir/${_app_image}"
 mkdir -p "$pkgdir/usr/bin"
 ln -sf "/opt/${_name}/${_app_image}" "$pkgdir/usr/bin/${_name}"
}
