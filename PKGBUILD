pkgbase=enemy-territory
pkgname=('enemy-territory' 'enemy-territory-data')
pkgver=2.60b
pkgrel=14
arch=('i686' 'x86_64')
url="http://www.splashdamage.com/wolfet"
license=('custom')
makedepends=('unzip')
source=('http://filebase.trackbase.net/et/full/et260b.x86_full.zip'
        'enemy-territory.desktop'
        'et.sh'
        'etded.sh'
        'etded.service')
md5sums=('6db59b543d42ee096ce263f3df571c08'
         '27532e5ae263d7ed86ca1ab17cb93fbd'
         'd47784d89cc43564f21194c86d6242fa'
         'ab126dd835c910f920bae4ab976e3bf8'
         '88def8a215ad2476a343e119b5d31a6b')

prepare() {
  # extract
  unzip -o et260b.x86_full.zip

  chmod +x et260b.x86_keygen_V03.run
  ./et260b.x86_keygen_V03.run --noexec --nox11 --target $pkgbase
}

package_enemy-territory() {
    pkgdesc="Wolfenstein: Enemy Territory is a completely free, standalone, team-based, multiplayer FPS"
    depends_i686=('enemy-territory-data' 'mesa' 'libxext')
    depends_x86_64=('enemy-territory-data' 'lib32-mesa' 'lib32-libxext' 'lib32-libxdamage')
    optdepends=('et-sdl-sound: SDL-based replacement for deprecated OSS-based sound systems of Wolf:ET')
    backup=(usr/share/enemy-territory/etmain/server.cfg
        usr/share/enemy-territory/etmain/punkbuster.cfg)
    install=enemy-territory.install

    # bin
    mkdir -p $pkgdir/usr/bin
    install -Dm 755 et.sh $pkgdir/usr/bin/et
    install -Dm 755 etded.sh $pkgdir/usr/bin/etded

    # data
    mkdir -p $pkgdir/usr/share/$pkgname
    install -Dm 755 $pkgbase/bin/Linux/x86/{et,etded}.x86 $pkgdir/usr/share/$pkgname/
    cp -R $pkgbase/etmain $pkgdir/usr/share/$pkgname/
    rm $pkgdir/usr/share/$pkgname/etmain/{pak0,pak1,pak2}.pk3

    # punkbuster
    mv $pkgbase/pb $pkgdir/usr/share/$pkgname/
    chmod +x $pkgdir/usr/share/$pkgname/pb/pbweb.x86
    mkdir -p $pkgdir/usr/share/$pkgname/pb/{dll,htm,svlogs,svss}
    install -dm 755 $pkgdir/usr/share/$pkgname/pb $pkgdir/usr/share/$pkgname/pb/{dll,htm,svlogs,svss}

    # etkey generator
    install -Dm 755 $pkgbase/etkey.sh $pkgdir/usr/bin/etkey

    # openurl
    install -Dm 755 $pkgbase/openurl.sh $pkgdir/usr/share/$pkgname

    # systemd unit
    mkdir -p $pkgdir/usr/lib/systemd/system/
    install -Dm 644 etded.service $pkgdir/usr/lib/systemd/system/

    # doc
    mkdir -p $pkgdir/usr/share/doc/$pkgname/pb
    mv $pkgbase/Docs/Help $pkgdir/usr/share/doc/$pkgname
    install -Dm 644 $pkgbase/Docs/MSR.rtf $pkgdir/usr/share/doc/$pkgname
    install -Dm 644 $pkgbase/CHANGES $pkgdir/usr/share/doc/$pkgname
    install -Dm 644 $pkgbase/Docs/{PB_EULA,PunkBuster}.rtf $pkgdir/usr/share/doc/$pkgname/pb

    # license
    mkdir -p $pkgdir/usr/share/licenses/enemy-territory
    install -Dm 644 $pkgbase/Docs/EULA_Wolfenstein_Enemy_Territory.txt $pkgdir/usr/share/licenses/enemy-territory

    # desktop file and icon
    mkdir -p $pkgdir/usr/share/{pixmaps,applications}
    install -Dm 644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm 644 $pkgname/ET.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
}

package_enemy-territory-data() {
    pkgdesc="Wolfenstein: Enemy Territory is a completely free, standalone, team-based, multiplayer FPS (data)"

    # data files
    mkdir -p $pkgdir/usr/share/enemy-territory/etmain
    install -Dm 644 $pkgbase/etmain/{pak0,pak1,pak2}.pk3 $pkgdir/usr/share/enemy-territory/etmain
}
