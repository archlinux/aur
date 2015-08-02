# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: LTSmash <lord.ltsmash@gmail.com>
# Contributor: Zauber Exonar <zauberexonar at gmail>
# Contributor: Simon Peter Nicholls <simon.peter.nicholls at googlemail>
# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=opensimulator
pkgver=0.8.1.1
pkgrel=1
pkgdesc="A 3D application server used to create a virtual environment or world"
arch=('i686' 'x86_64')
url="http://opensimulator.org/wiki/Main_Page"
license=('BSD')
depends=('mono' 'sqlite')
optdepends=('mysql')
install=$pkgname.install
source=("http://opensimulator.org/dist/opensim-${pkgver}-source.tar.gz"
		"opensimulator.sh"
		"opensimulator-robust.sh"
		"opensimulator.service"
		"opensimulator-robust.service")
md5sums=('2f3ecdf331eca9943be65f31282c8fe3'
         '58270c537e91b85c1121aacc2ccb194e'
         'cb3b9d774a9973bb438c9052dbe77112'
         'c2686291b848bf584c9a05fbc6bac303'
         '6201d8b4b9a498f2efc523e58a4abf75')
backup=(opt/$pkgname/bin/OpenSim.ini)

build() {
cd "$srcdir"/opensim-$pkgver

# we need Mono
export MONO_SHARED_DIR="$srcdir"/.wabi
mkdir -p $MONO_SHARED_DIR

# build opensimulator using nant
./runprebuild.sh
xbuild
}

package() {
cd "$srcdir"/opensim-$pkgver

# delete unneeded and create log/ini files
[[ `uname -m` = "i686" ]] && find bin -name "*x86_64.so" -delete

# ensure log file already exists
touch bin/OpenSim.log

# create a default OpenSim.ini for installs
sed 's/^\(\s*\)\; \(Include.*Standalone\.ini\)/\1\2/' bin/OpenSim.ini.example >bin/OpenSim.ini

#copying Mono.Posix.dll so that OpenSimulator can use sockets, and by extension MySQL
cp /usr/lib/mono/4.5/Mono.Posix.dll bin/Mono.Posix.dll

# install
install -d "$pkgdir"/opt/$pkgname/bin
cp -r bin/* "$pkgdir"/opt/$pkgname/bin/
mv README.md README.txt
install -Dm644 {CONTRIBUTORS,README}.txt "$pkgdir"/opt/$pkgname

# set permissions
find "$pkgdir"/opt/$pkgname/bin -type d -exec chmod 755 {} +
find "$pkgdir"/opt/$pkgname/bin -type f -exec chmod 644 {} +
find "$pkgdir"/opt/$pkgname/bin -name "*.exe" -exec chmod 755 {} +
find "$pkgdir"/opt/$pkgname/bin -name "*.ini" -exec chmod 666 {} +
find "$pkgdir"/opt/$pkgname/bin -name "*.xml" -exec chmod 666 {} +
chmod 777 "$pkgdir"/opt/$pkgname/bin/{,*/}
chmod 755 "$pkgdir"/opt/$pkgname/bin/opensim-ode.sh
chmod 666 "$pkgdir"/opt/$pkgname/bin/OpenSim.log

# install scripts, service and license files
install -m755 -D ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
install -m755 -D ../opensimulator-robust.sh "$pkgdir"/usr/bin/opensimulator-robust
install -Dm644 "$srcdir/opensimulator.service" "$pkgdir/usr/lib/systemd/system/opensimulator@.service"
install -Dm644 "$srcdir/opensimulator-robust.service" "$pkgdir/usr/lib/systemd/system/opensimulator-robust@.service"
install -m644 -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  
# remove *.dylib files (thanks to Schala)
cd "$pkgdir"/opt/$pkgname/bin
rm -f libopenjpeg-dotnet-2-1.5.0-dotnet-1.dylib
rm -f lib32/libBulletSim.dyliblib64/libode.dylib
rm -rf lib64/{libopenjpeg-dotnet.dylib,libsqlite3.dylib}
}
