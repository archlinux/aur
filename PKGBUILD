# Maintainer: RedCubeDev <someredcubedev@gmail.com>
pkgname='rctc'
pkgver=2.3.1.420
pkgrel=1
pkgdesc="Commandline Compiler for the ReCT Programming language"
arch=('x86_64')
url="http://rect.ml/"
license=('GPL3')
depends=('dotnet-runtime-3.1')
makedepends=('git' 'dotnet-sdk-3.1')
source=("rctc::git://github.com/RedCubeDev-ByteSpace/ReCT.git")
md5sums=('SKIP')

pkgver() {
   cd "$pkgname"
   thever=$(git describe --tags)
   cutver=${thever%%-*}
   echo "$cutver"
}

package() {
	# getting the source of the lastest release
   cd "$pkgname"
   git checkout ${pkgver}
   
   # building the lastest release of rctc
   cd "rctc"
   dotnet build -c Release

   # install compiled binary
   cd "bin/Release/netcoreapp3.1/"
   mkdir -p "$pkgdir/usr/bin/rctc"
   mkdir -p "$pkgdir/usr/bin/rctc/Packages"
   install -Dm755 ./rctc ./rctc.dll ./rctc.runtimeconfig.json ./ReCT.dll "$pkgdir/usr/bin/rctc"
   install -Dm755 ./Json.Net.dll ./Mono.Cecil.dll ./Mono.Options.dll ./Mono.Cecil.Rocks.dll "$pkgdir/usr/bin/rctc"

   # building all system packages
   cd ../../../..
   cd "System Libs"
   syspacks=( "sys" "math" "io" "net" "web" "audio" )

   for i in "${syspacks[@]}"
   do
      cd "${i}lib"
      printf "\033[0;32m======> BUILDING '$i'\033[0m\n"
      dotnet build -c Release
      cd "./bin/Release/netcoreapp3.1/"
      mv "./${i}lib.dll" "./ReCT.${i}.pack"
      install -Dm755 "./ReCT.${i}.pack" "$pkgdir/usr/bin/rctc/Packages"
      cd ../../../..
   done
}
