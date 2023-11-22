# Maintainer: Erik Bjäreholt <erik@bjareho.lt>
# Maintainer: Johan Bjäreholt <johan@bjareho.lt>

# PRs welcome at: https://github.com/ActivityWatch/aur-activitywatch-bin

pkgname=activitywatch-bin
pkgver='0.12.3b15'
pkgrel=1
epoch=
pkgdesc="Track how you spend time on your computer. Simple, extensible, no third parties."
arch=('x86_64')
url="https://github.com/ActivityWatch/activitywatch"
license=('MPL2')
provides=("activitywatch")
conflicts=("activitywatch")
depends=(
    #'qt5-base'
    #'qt5-svg'
    #'gtk3'
    #'openssl-1.0'
)
source=("https://github.com/ActivityWatch/activitywatch/releases/download/v${pkgver}/activitywatch-v${pkgver}-linux-x86_64.zip")
md5sums=('1d746920799e6d4eaef486ad45ef771a')

package() {
    # Install into /opt/activitywatch
    mkdir -p $pkgdir/opt
    cp -r activitywatch $pkgdir/opt

    # Symlink executables to /usr/bin
    mkdir -p $pkgdir/usr/bin
    execnames=("aw-qt")
    for name in "${execnames[@]}"; do
        ln -s /opt/activitywatch/$name $pkgdir/usr/bin/$name
    done

    modulenames=("aw-server" "aw-server-rust" "aw-watcher-afk" "aw-watcher-window" "aw-watcher-input" "aw-notify" "aw-server-rust/aw-sync")
    for name in "${modulenames[@]}"; do
        # if a module has a path, use that, 
        # else assume its in a dir with the same name as the module
        dir=$(dirname $name)
        if [ "$dir" == "." ]; then
            dir=$name
        else
            # strip the path from the name
            name=$(basename $name)
        fi
        # check that the module exists
        if [ ! -f "/opt/activitywatch/$dir/$name" ]; then
            echo "WARNING: $dir/$name does not exist, skipping"
            continue
        fi
        ln -s /opt/activitywatch/$dir/$name $pkgdir/usr/bin/$name
    done

    # Add .desktop file for autostart
    mkdir -p $pkgdir/etc/xdg/autostart
    cp activitywatch/aw-qt.desktop $pkgdir/etc/xdg/autostart

    # See: https://aur.archlinux.org/packages/activitywatch-bin/#comment-834170
    #rm $pkgdir/opt/activitywatch/libharfbuzz.so*
    #rm $pkgdir/opt/activitywatch/libfreetype.so*
    #rm $pkgdir/opt/activitywatch/libfontconfig.so*

    # These takes a lot of space, getting rid of them would be nice
    #rm $pkgdir/opt/activitywatch/libicu*.so*

    # One or more of these is making aw-qt SEGFAULT
    #rm $pkgdir/opt/activitywatch/libreadline.so*
    #rm $pkgdir/opt/activitywatch/libssl.so*
    #rm $pkgdir/opt/activitywatch/libavahi*.so*
    #rm $pkgdir/opt/activitywatch/libQt5*.so*
    #rm $pkgdir/opt/activitywatch/libstdc++.so*
    #rm $pkgdir/opt/activitywatch/libgpg-error.so*
    #rm $pkgdir/opt/activitywatch/libz.so*
    #rm $pkgdir/opt/activitywatch/libX*.so*
    #rm $pkgdir/opt/activitywatch/libxcb*.so*
    #rm $pkgdir/opt/activitywatch/libwayland*.so*
    #rm $pkgdir/opt/activitywatch/libpng*.so*
    #rm $pkgdir/opt/activitywatch/libgtk*.so*
    #rm $pkgdir/opt/activitywatch/libgnutls*.so*
    #rm $pkgdir/opt/activitywatch/libcairo*.so*
}
