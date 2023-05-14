# Maintainer: pragerabez

pkgname=mbed-studio-bin
_archivename=MbedStudio
_binname=${pkgname%%-bin}
DOMAIN="https://studio.mbed.com"
ARCHIVE_PATH="/installers/release-1.4.5/1.4.5.d5955e24/linux/MbedStudio.tar.gz"
pkgver=1.4.5
pkgrel=14
pkgdesc="free IDE and toolchain for Mbed OS 5 application and library development"
arch=('x86_64')
url="https://os.mbed.com/studio/"
license=('COMMERCIAL')
depends=('ncurses5-compat-libs' 'gnome-keyring')
provides=('mbed-studio')
options=(!strip)
source=("$DOMAIN$ARCHIVE_PATH"
"$pkgname.sh"
"$pkgname.install")

package() {
	cd "$srcdir"
	msg2 "Extracting..."
	
	INSTALL_PATH="$pkgdir/usr/share/$pkgname"
    TOOLS_PATH="$INSTALL_PATH/mbed-studio-tools"
    LAUNCHER_PATH="$pkgdir/usr/share/applications"
    ICON_PATH_PREFIX="$pkgdir/usr/share/icons/hicolor"
    BIN_PATH="$INSTALL_PATH/bin"
    #EXEC_PATH contain a modified bash file checks if mbed-studio-tools exist in user .config before running mbed-studio else symlink
    EXEC_PATH="$pkgdir/usr/bin/$pkgname"
    
    # move the tools where needed
    mkdir -p "$INSTALL_PATH"
    cp -r "$_archivename/$_binname-tools" "$INSTALL_PATH"
    chmod -R 755 "$TOOLS_PATH/ac6"
    
    # copy tools.json where needed
    install -D "$_archivename/tools.json" "$TOOLS_PATH/tools.json"
    
    # move the application where needed
    install -D "$_archivename/$_binname" "$INSTALL_PATH/$_binname"
    
    # move bash runfile (custom) where needed
    install -D "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # add icons
    ICO_SIZES=(16 24 32 48 64 96 128 256 512 1024)
    for SIZE in "${ICO_SIZES[@]}"
    do
        ICON_PATH="$ICON_PATH_PREFIX/${SIZE}x${SIZE}/apps"
        mkdir -p "$ICON_PATH"
        FILENAME1="icons/icon_${SIZE}x${SIZE}.png"
        if [ -f $_archivename/$FILENAME1 ]; then
            install -D "$_archivename/$FILENAME1" "$ICON_PATH/$_binname.png"
        else
            FILENAME2="icons/icon_${SIZE}.png"
            if [ -f $_archivename/$FILENAME2 ]; then
            install -D "$_archivename/$FILENAME2" "$ICON_PATH/$_binname.png"
            fi
        fi
    done

    # create a launcher
    ICON_PATH_PREFIX="/usr/share/icons/hicolor"
    ICON_PATH="$ICON_PATH_PREFIX/256x256/apps/$_binname.png"
    install -d "$LAUNCHER_PATH"
    sed -e "s,\\\$bin_path\\\$,/usr/bin/$pkgname,g" -e "s,\\\$icon_path\\\$,${ICON_PATH},g" $_archivename/$_binname.desktop.template > "$LAUNCHER_PATH/$_binname.desktop"

    # udev rules (https://github.com/mbedmicro/pyOCD/tree/master/udev)
    # copy udev rules
    mkdir -p "$pkgdir/etc/udev/rules.d/"
    cp $_archivename/pyocd-udev-rules/*.rules "$pkgdir/etc/udev/rules.d/"
	chmod +x "$INSTALL_PATH/$_binname"
	chmod +x "$EXEC_PATH"
}

md5sums=('be7dfb7b3dfda5a35c4552d6e255e33d'
         'ba5f16b0d7eeef5b124cd68078a38672'
         '7cf4ae1f6777f0c610125a59b0fefca6')
