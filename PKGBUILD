# Maintainer: pragerabez

pkgname=mbed-studio-bin
_archivename=MbedStudio
_binname=${pkgname%%-bin}
DOMAIN="https://studio.mbed.com"
ARCHIVE_PATH="/installers/release-0.9.1/0.9.1.a7d67582/linux/MbedStudio.tar.gz"
CLANGD_FILENAME="clangd-8.0.1.zip"
INTERNAL_CLANG_VER="8"
pkgver=0.9.1
pkgrel=1
pkgdesc="free IDE and toolchain for Mbed OS 5 application and library development, run as root for armc6 compiler"
arch=('x86_64')
url="https://os.mbed.com/studio/"
license=('COMMERCIAL')
depends=('ncurses5-compat-libs')
provides=('mbed-studio')
options=(!strip)
source=("$DOMAIN$ARCHIVE_PATH"
"$DOMAIN/tools/linux/clangd-ubuntu-18/$CLANGD_FILENAME"
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
    
    # move clangd as needed
    mkdir -p "$TOOLS_PATH/clangd"
    cp "clang-$INTERNAL_CLANG_VER" "$TOOLS_PATH/clangd"
    cp "clangd" "$TOOLS_PATH/clangd"
    cp "generate_compile_commands.py" "$TOOLS_PATH/clangd"
    
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

md5sums=('c9acf7d6ea77e191c7497d8ed4221873'
         'fdb5e9446da4a0b4b0794172d8891824'
         'ba5f16b0d7eeef5b124cd68078a38672'
         '7cf4ae1f6777f0c610125a59b0fefca6')
