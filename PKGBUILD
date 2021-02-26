# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=(boinc-manager-web-git)
pkgver=r163.24e3847
pkgrel=2
pkgdesc='Web Client for BOINC'
arch=('x86_64' 'aarch64')
url='https://github.com/adamradocz/boinc-manager'
license=('GPL3')
makedepends=('dotnet-sdk>=3' 'yarn' 'git')
depends=('aspnet-runtime')
source=("boinc-manager::git+https://github.com/adamradocz/boinc-manager"
        'boinc-manager-web.service'
        'boinc-manager-web.sysusers'
        'boinc-manager-web.tmpfiles')
sha512sums=('SKIP'
            '9d3a6f81eb1186aa7c65e7d95cf55493e4a1bdd58b0d3e3b0ac77e0f2d2fdf4156dd666706e3750f5c794b7cba9a5744fc36f549649f00d529b76390bef1a4f6'
            'fcf078f5be903f377c7c78921521de5d9a7a4df9e5086ddd18e6e4baef3cfb653781c2a98509304628d754878d13ce0455c6e53a6074978e40460bae909d3be4'
            '6139d5c155b0bede2deb6b21d9161cb3d877ca5a12981325439bb048035dab3704182c4f958b7af7a56f25e86b190f03ed11936558e38231f35136d1e6a77862')

pkgver() {
	cd "$srcdir/boinc-manager"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
	cd boinc-manager/BoincManagerWeb

	# yarn install
	dotnet restore BoincManagerWeb.csproj

	# Disable dotnet telemetry
	export DOTNET_CLI_TELEMETRY_OPTOUT=1

	dotnet publish "BoincManagerWeb.csproj" -c Release --no-restore -o "$PWD/publish"
	#dotnet build --configuration Release
	# Ideally, this would be run in package() with the --output variable pointing
	# to "$pkgdir"/usr/lib/jellyfin, but this step fails in fakeroot.
	# The makepkg output looks like
	#   Restore completed in 56.84 ms for /aur/jellyfin-git/src/jellyfin/Jellyfin.Server/Jellyfin.Server.csproj.
	#   ==> ERROR: A failure occurred in package().
	# without indicating any sort 
	#dotnet publish --configuration Release --output "$PWD"/publish
	# Clean up the runtimes folder (keep linux-*)
	rm -rfv publish/runtimes/{alpine-*,osx*,tizen-*,win*}
}

package(){

	mkdir -p "$pkgdir"/usr/lib
	cp -dr --no-preserve='ownership' boinc-manager/BoincManagerWeb/publish "$pkgdir"/usr/lib/boinc-manager-web

	install -Dm 644 boinc-manager-web.service -t "$pkgdir"/usr/lib/systemd/system/
	install -Dm 644 boinc-manager-web.sysusers "$pkgdir"/usr/lib/sysusers.d/boinc-manager-web.conf
	install -Dm 644 boinc-manager-web.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/boinc-manager-web.conf
}
