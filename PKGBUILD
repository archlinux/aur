# Maintainer: Alan Jenkins <alan.james.jenkins [at] gmail [dot] com>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Karsten Anderson <orbitcoder@gmail.com>

pkgname=ut2004-steam
epoch=1
pkgver=3369_2
_pkgvermaj=3369
_pkgvermin=2
pkgrel=4
pkgdesc="Popular first person shooter, native Linux version, installing data files from Steam (requires you having had purchased the Steam version)."
epoch=1
arch=('i686' 'x86_64')
url="http://www.unrealtournament2004.com"
license=('custom')
depends=('sdl' 'openal' 'steamcmd' 'libstdc++5')
conflicts=('ut2004')
install=ut2004.install
changelog=ChangeLog
#source=("http://planet64bit.de/fileZ/ut2004-lnxpatch3369.tar.bz2"
source=("https://github.com/demon012/archlinux-package-ut2004-steam/raw/master/ut2004-lnxpatch$_pkgvermaj-$_pkgvermin.tar.bz2"
    "ut2004.desktop"
    "ut2004-install.sh"
    "ut2004-update.sh"
    "ut2004.sh")

    md5sums=('0fa447e05fe5a38e0e32adf171be405e'
    'b4ca5855b8fc6d283b49c8df469d61c2'
    '5608b9b891788ae3d6a53afaf2a370d2'
    '1119a2bbec7211ee11c939941af3cb48'
    '85623fe9fecd0678e4f12902c22d7272')

package() {

    # Making sure directories exist.
    install -d $pkgdir/usr/share/{applications,pixmaps,licenses}
    install -d $pkgdir/opt/ut2004
    install -d $pkgdir/opt/ut2004/{Animations,Help,Textures,Web,Benchmark,ForceFeedback,KarmaData,Maps,Music,StaticMeshes,Sounds,Speech,System}
    install -d $pkgdir/usr/bin/

    # Install UT2004 Linux patch data. Will later do a non-clobber
    # move over the top of it.
    cp -R $srcdir/UT2004-Patch/* $pkgdir/opt/ut2004

    # Install helper scripts.
    install -D -m 755 $srcdir/ut2004-install.sh \
         $pkgdir/opt/ut2004/Scripts/ut2004-install
    install -D -m 755 $srcdir/ut2004-update.sh \
         $pkgdir/opt/ut2004/Scripts/ut2004-update
    install -D -m 755 $srcdir/ut2004.sh \
         $pkgdir/opt/ut2004/Scripts/ut2004

    # Install license.
    install -D -m 644 $srcdir/UT2004-Patch/System/License.int \
         $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # Install desktop file.
    install -D -m 644 $srcdir/ut2004.desktop \
             $pkgdir/usr/share/applications/ut2004.desktop

    # Create symlinks to add the ut2004 startup and utility scripts to usr/bin
    ln -s /opt/ut2004/Scripts/ut2004 $pkgdir/usr/bin/ut2004 || return 1
    ln -s /opt/ut2004/Scripts/ut2004-install $pkgdir/usr/bin/ut2004-install || return 1
    ln -s /opt/ut2004/Scripts/ut2004-update $pkgdir/usr/bin/ut2004-update || return 1
    # chmod 755 $pkgdir/usr/bin/*


    if [ "$CARCH" == "x86_64" ]
    then
         sed 's/ut2004-bin/&-linux-amd64/g' $pkgdir/opt/ut2004/Scripts/ut2004 > $pkgdir/opt/ut2004/Scripts/ut2004.TMP

         install -D -m 755 $pkgdir/opt/ut2004/Scripts/ut2004.TMP $pkgdir/opt/ut2004/Scripts/ut2004
    else
        rm $pkgdir/opt/ut2004/System/ucc-bin-linux-amd64
        rm $pkgdir/opt/ut2004/System/ut2004-bin-linux-amd64
    fi

    # Installing empty icon and cd key file placeholders.
    cat /dev/null > $pkgdir/usr/share/pixmaps/Unreal.ico
    chmod 644 $pkgdir/usr/share/pixmaps/Unreal.ico || return 1
    cat /dev/null > $pkgdir/opt/ut2004/System/CDkey
    chmod 644 $pkgdir/opt/ut2004/System/CDkey || return 1


    # Create symbolic links to system libraries in game directory.
    ln -s /usr/lib/libSDL-1.2.so.0 $pkgdir/opt/ut2004/System || return 1
    chmod 644 $pkgdir/opt/ut2004/System/libSDL-1.2.so.0 || return 1
    ln -s /usr/lib/libopenal.so $pkgdir/opt/ut2004/System/openal.so || return 1
    chmod 644 $pkgdir/opt/ut2004/System/openal.so || return 1
}

# vim:set ts=2 sw=2 et:
