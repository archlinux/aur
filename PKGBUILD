# Maintainer: laserK3000 <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
pkgname=mvimpact-acquire
pkgver=2.50.1
pkgrel=1
epoch=
pkgdesc="Driver API for controlling Matrix Vision and other genicam hardware and for image acquisition."
arch=("x86_64")
url="https://www.matrix-vision.com/en/product-line/software/mvimpact-acquire-sdk"
license=('custom')
groups=()
depends=('bash'
        'fltk'
        'wxwidgets-qt5')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("http://static.matrix-vision.com/mvIMPACT_Acquire/$pkgver/mvGenTL_Acquire-x86_64_ABI2-$pkgver.tgz"
        62-buffers-performance.conf
        resize-usbfs-buffersize.service
        resize_usbfs_buffersize.sh
        52-mvbf3.rules
        52-u3v.rules
        # "$pkgname-$pkgver.patch"
        $pkgname.install)
noextract=()
sha256sums=('a59dd901be28c59a855127059410bd9ebaa8e6b40408937d85bdbfa975896ae2'
            '45fcfa2f540d825452b1c145bc23bc65870d2228520d14fdfabc8d8ff7c82f02'
            '42e03169a98e5188a8dbfa01a4c133e500487010d2d6ea06fe8650c0c2b246f8'
            '6675ce72edfd64de34ba54cbb992deb8d5906d96326c4ba0d1feb3e3aa9aad64'
            'e050da6fa99e8bebac9fd099cb107c3f0233759af5c6026307547985880c5bbb'
            'b3b3259b284fc7d6abe4a4d67ca448fad6fee3b6fb246c979c2552caddd1078f'
            '6d2b16a4617d001ba9fd93c72405c18ebcceaae628feea5c262d74096702f3e4')
validpgpkeys=()

DEF_DIRECTORY=/opt/mvIMPACT_Acquire
GENICAM_VERSION=3_3
GENICAM_EXPORT_FILE=genicam.sh
ACQUIRE_EXPORT_FILE=acquire.sh
GENICAM_LDSOCONF_FILE=genicam.conf
ACQUIRE_LDSOCONF_FILE=acquire.conf
TARGET=x86_64
DEF_DATA_DIRECTORY=/opt/mvIMPACT_Acquire/data
TARGET_POINTER_LENGTH=64
TARGET_UNCAPITALIZED=x86_64
GENILIBPATH=Linux64_x64
# KM_SRC_DIR=$DEF_DIRECTORY=/kernelmodules/linux/mvBlueNAOS
# BN_MODNAME="mvpci"

# prepare() {
# 	cd "$srcdir"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
    export MVIMPACT_ACQUIRE_SOURCE_DIR="$srcdir/mvIMPACT_Acquire-x86_64-$pkgver"
    export WX_CONF_TOOL=$(which wx-config)
    export FLTK_CONF_TOOL=$(which fltk-config)
    
    cd "$MVIMPACT_ACQUIRE_SOURCE_DIR"
	make 'x86_64'

    cd "$srcdir"
    echo 'export GENICAM_ROOT='$DEF_DIRECTORY'/runtime' >> $GENICAM_EXPORT_FILE
    echo 'export GENICAM_ROOT_V'$GENICAM_VERSION'='$DEF_DIRECTORY'/runtime' >> $GENICAM_EXPORT_FILE
    echo 'export GENICAM_CACHE_V'$GENICAM_VERSION'='$DEF_DIRECTORY'/runtime/cache/v'$GENICAM_VERSION >> $GENICAM_EXPORT_FILE
    echo 'if [ x$GENICAM_GENTL'$TARGET_POINTER_LENGTH'_PATH == x ]; then
    export GENICAM_GENTL'$TARGET_POINTER_LENGTH'_PATH='$DEF_DIRECTORY'/lib/'$TARGET_UNCAPITALIZED'
elif [ x$GENICAM_GENTL'$TARGET_POINTER_LENGTH'_PATH != x'$DEF_DIRECTORY'/lib/'$TARGET_UNCAPITALIZED' ]; then
    if ! $(echo $GENICAM_GENTL'$TARGET_POINTER_LENGTH'_PATH | grep -q ":'$DEF_DIRECTORY'/lib/'$TARGET_UNCAPITALIZED'"); then
        export GENICAM_GENTL'$TARGET_POINTER_LENGTH'_PATH=$GENICAM_GENTL'$TARGET_POINTER_LENGTH'_PATH:'$DEF_DIRECTORY'/lib/'$TARGET_UNCAPITALIZED'
    fi
fi' >> $GENICAM_EXPORT_FILE
    echo 'export GENICAM_LOG_CONFIG_V'$GENICAM_VERSION'='$DEF_DIRECTORY'/runtime/log/config-unix/DefaultLogging.properties' >> $GENICAM_EXPORT_FILE

    echo 'export MVIMPACT_ACQUIRE_DIR='$DEF_DIRECTORY >> $ACQUIRE_EXPORT_FILE
    echo 'export MVIMPACT_ACQUIRE_DATA_DIR='$DEF_DATA_DIRECTORY >> $ACQUIRE_EXPORT_FILE

    echo "$DEF_DIRECTORY/lib/$TARGET" >> $ACQUIRE_LDSOCONF_FILE
    echo "$DEF_DIRECTORY/Toolkits/expat/bin/$TARGET/lib" >> $ACQUIRE_LDSOCONF_FILE

    echo "$DEF_DIRECTORY/runtime/bin/$GENILIBPATH" >> $GENICAM_LDSOCONF_FILE

    echo '@plugdev            -       nice            -20' >> limits_acquire.conf
    echo '@plugdev            -       rtprio          99' >> limits_acquire.conf


}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
    cd $srcdir
    mkdir -p "$pkgdir/$DEF_DIRECTORY"
    cp -a "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/." "${pkgdir}/$DEF_DIRECTORY"
    mkdir -p "$pkgdir/$DEF_DIRECTORY/runtime/cache/v$GENICAM_VERSION"
    chmod -R 777 "$pkgdir/$DEF_DIRECTORY/runtime/cache"
    ln -s libusb-1.0.so.0.1.0 $pkgdir/$DEF_DIRECTORY/Toolkits/libusb-1.0.21/bin/$TARGET/lib/libusb-1.0.so.0
    ln -s libusb-1.0.so.0     $pkgdir/$DEF_DIRECTORY/Toolkits/libusb-1.0.21/bin/$TARGET/lib/libusb-1.0.so
    ln -s libudev.so.0.13.0   $pkgdir/$DEF_DIRECTORY/Toolkits/libudev/bin/$TARGET/lib/libudev.so.0
    ln -s libudev.so.0        $pkgdir/$DEF_DIRECTORY/Toolkits/libudev/bin/$TARGET/lib/libudev.so

    mkdir -p $pkgdir/usr/bin/
    ln -s $DEF_DIRECTORY/apps/mvPropView/$TARGET/wxPropView $pkgdir/usr/bin/wxPropView
    ln -s $DEF_DIRECTORY/apps/mvIPConfigure/$TARGET/mvIPConfigure $pkgdir/usr/bin/mvIPConfigure
    ln -s $DEF_DIRECTORY/apps/mvDeviceConfigure/$TARGET/mvDeviceConfigure $pkgdir/usr/bin/mvDeviceConfigure
    mkdir -p     "$pkgdir/$DEF_DATA_DIRECTORY/logs"
    chmod -R 777 "$pkgdir/$DEF_DATA_DIRECTORY/logs"
    mkdir -p     "$pkgdir/$DEF_DATA_DIRECTORY/genicam"
    chmod -R 777 "$pkgdir/$DEF_DATA_DIRECTORY/genicam"
    install -Dm 644 $pkgdir/$DEF_DIRECTORY/ignoredInterfaces.txt $pkgdir/$DEF_DATA_DIRECTORY/logs
    # not relevant as pcie kernel module is not build
    # install -Dm 644 $pkgdir/$DEF_DIRECTORY/ignoredInterfaces.pcie.txt $pkgdir/$DEF_DATA_DIRECTORY/logs
    sed -i '/GEV=I/d' $pkgdir/$DEF_DATA_DIRECTORY/logs/ignoredInterfaces.txt
    sed -i '/U3V=I/d' $pkgdir/$DEF_DATA_DIRECTORY/logs/ignoredInterfaces.txt
    install -Dm 644 $pkgdir/$DEF_DIRECTORY/apps/mvDebugFlags.mvd $pkgdir/$DEF_DATA_DIRECTORY/logs
    # install -Dm 644  
    install -Dm 644 $srcdir/$GENICAM_EXPORT_FILE   $pkgdir/etc/profile.d/$GENICAM_EXPORT_FILE 
    install -Dm 644 $srcdir/$ACQUIRE_EXPORT_FILE   $pkgdir/etc/profile.d/$ACQUIRE_EXPORT_FILE
    install -Dm 644 $srcdir/$GENICAM_LDSOCONF_FILE $pkgdir/etc/ld.so.conf.d/$GENICAM_LDSOCONF_FILE
    install -Dm 644 $srcdir/$ACQUIRE_LDSOCONF_FILE $pkgdir/etc/ld.so.conf.d/$ACQUIRE_LDSOCONF_FILE
    install -Dm 644 $srcdir/limits_acquire.conf $pkgdir/etc/security/limits.d/acquire.conf

    ln -s libmvGenTLProducer.so      $pkgdir/$DEF_DIRECTORY/lib/$TARGET/mvGenTLProducer.cti
    ln -s libmvGenTLProducer.PCIe.so $pkgdir/$DEF_DIRECTORY/lib/$TARGET/mvGenTLProducer.PCIe.cti

    setcap cap_net_bind_service,cap_net_raw+ep $pkgdir/$DEF_DIRECTORY/apps/mvPropView/$TARGET/wxPropView
    setcap cap_net_bind_service,cap_net_raw+ep $pkgdir/$DEF_DIRECTORY/apps/mvIPConfigure/$TARGET/mvIPConfigure
    setcap cap_net_bind_service,cap_net_raw+ep $pkgdir/$DEF_DIRECTORY/apps/mvDeviceConfigure/$TARGET/mvDeviceConfigure
    
    install -Dm 644 $srcdir/62-buffers-performance.conf $pkgdir/usr/share/$pkgname/62-buffers-performance.conf
    install -Dm 644 $srcdir/52-mvbf3.rules $pkgdir/usr/share/$pkgname/52-mvbf3.rules
    install -Dm 644 $srcdir/52-u3v.rules $pkgdir/usr/share/$pkgname/52-u3v.rules

    install -Dm 644 $srcdir/resize-usbfs-buffersize.service $pkgdir/etc/systemd/system/resize-usbfs-buffersize.service
    install -Dm 755 $srcdir/resize_usbfs_buffersize.sh $pkgdir/$DEF_DIRECTORY/Scripts/resize_usbfs_buffersize.sh

    # fixing incorrect permissions
    chmod -R a+r $pkgdir/$DEF_DIRECTORY/runtime
    chmod a+x    $pkgdir/$DEF_DIRECTORY/lib/x86_64/*.so
    chmod -R a+x $pkgdir/$DEF_DIRECTORY/runtime/bin/Linux64_x64
    chmod 755    $pkgdir/$DEF_DIRECTORY/runtime/licenses
    chmod -R 777 $pkgdir/$DEF_DIRECTORY/runtime/cache
    chmod -R 777 $pkgdir/$DEF_DIRECTORY/runtime/log
    chmod -R 777 $pkgdir/$DEF_DATA_DIRECTORY
    
    # licenses
	install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/doc/EULA.txt" "$pkgdir/usr/share/licenses/${pkgname}/EULA.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/Toolkits/FreeImage3160/license-fi.txt" "$pkgdir/usr/share/licenses/${pkgname}/toolkits/FreeImage3160/license-fi.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/Toolkits/FreeImage3160/license-gplv2.txt" "$pkgdir/usr/share/licenses/${pkgname}/toolkits/FreeImage3160/license-gplv2.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/Toolkits/FreeImage3160/license-gplv3.txt" "$pkgdir/usr/share/licenses/${pkgname}/toolkits/FreeImage3160/license-gplv3.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/Toolkits/expat/license.txt" "$pkgdir/usr/share/licenses/${pkgname}/toolkits/expat/license.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/kernelmodules/linux/mvBlueNAOS/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/kernelmodules/linux/mvBlueNAOS/LICENSE.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/runtime/License_ReadMe.txt" "$pkgdir/usr/share/licenses/${pkgname}/runtime/License_ReadMe.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/runtime/licenses/CLSerAll_LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/runtime/CLSerAll_LICENSE.tx"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/runtime/licenses/GenICam_License_20180629.pdf" "$pkgdir/usr/share/licenses/${pkgname}/runtime/GenICam_License_20180629.pdf"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/runtime/licenses/LGPL.txt" "$pkgdir/usr/share/licenses/${pkgname}/runtime/LGPL.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/runtime/licenses/MIT_License.txt" "$pkgdir/usr/share/licenses/${pkgname}/runtime/MIT_License.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/runtime/licenses/pcre2_License.txt" "$pkgdir/usr/share/licenses/${pkgname}/runtime/pcre2_License.txt"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/runtime/licenses/xs3p_License.mht" "$pkgdir/usr/share/licenses/${pkgname}/runtime/xs3p_License.mht"
    install -Dm 644 "${srcdir}/mvIMPACT_Acquire-x86_64-$pkgver/runtime/licenses/xxhash_License.txt" "$pkgdir/usr/share/licenses/${pkgname}/runtime/xxhash_License.txt"
}
