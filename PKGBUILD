# Maintainer: humanbeing27 <electronneutrino27@proton.me>

pkgname='waydroid-settings-git'
pkgver=r105.61187ec
pkgrel=1
makedepends=('git')
arch=('any')
pkgdesc="GTK app written in Python to control Waydroid settings"
url="https://github.com/axel358/Waydroid-Settings"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"git+$url.git#branch=main"
	"quackdoc_scripts::git+https://github.com/Quackdoc/waydroid-scripts.git"
	"git+https://github.com/electrikjesus/waydroid-10-11-switch-script.git"
	"git+https://github.com/electrikjesus/wd-scripts.git")
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare(){
	target_dirs=(
		"$srcdir/Waydroid-Settings"
	)
	for target_dir in "${target_dirs[@]}"
	do
		cd $target_dir
		git submodule init
        grep submodule .gitmodules | sed 's/\[submodule "//;s/"\]//' | while read -r module
        do
            repo=$(basename "$module")
            git config "submodule.$module.url" "$srcdir/$repo"
        done
        git -c protocol.file.allow=always submodule update
	done
}
pkgver() {
    cd "$srcdir/Waydroid-Settings"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package(){
	depends=("waydroid" "polkit" "gtk3" "vte3" "webkit2gtk")
	mkdir -p "$pkgdir/usr/share"
	cp -vr "$srcdir/Waydroid-Settings" "$pkgdir/usr/share/waydroid-settings"
	install -Dm755 "$pkgdir/usr/share/waydroid-settings/waydroid-settings.sh" \
		"$pkgdir/usr/bin/waydroid-settings"
	install -Dm755 "$pkgdir/usr/share/waydroid-settings/waydroid-helper" \
		"$pkgdir/usr/bin/waydroid-helper"
	install -Dm644 "$pkgdir/usr/share/waydroid-settings/icon2.png" \
		"$pkgdir/usr/share/icons/hicolor/1232x1228/waydroid-settings.png"
	install -Dm644 "$pkgdir/usr/share/waydroid-settings/install-to-waydroid.desktop" \
		"$pkgdir/usr/share/applications/install-to-waydroid.desktop"
	install -Dm644 "$pkgdir/usr/share/waydroid-settings/waydroid-settings.desktop" \
		"$pkgdir/usr/share/applications/waydroid-settings.desktop"
	install -Dm644 "$pkgdir/usr/share/waydroid-settings/org.freedesktop.policykit.waydroid-helper.policy" \
		"$pkgdir/usr/share/polkit-1/actions//org.freedesktop.policykit.waydroid-helper.policy"
	rm -r "$pkgdir/usr/share/waydroid-settings/waydroid-settings.sh" \
		"$pkgdir/usr/share/waydroid-settings/waydroid-helper" \
		"$pkgdir/usr/share/waydroid-settings/icon2.png" \
		"$pkgdir/usr/share/waydroid-settings/install-to-waydroid.desktop" \
		"$pkgdir/usr/share/waydroid-settings/waydroid-settings.desktop" \
		"$pkgdir/usr/share/waydroid-settings/org.freedesktop.policykit.waydroid-helper.policy" \
		"$pkgdir/usr/share/waydroid-settings/.idea" \
		"$pkgdir/usr/share/waydroid-settings/install.sh" \
		"$pkgdir/usr/share/waydroid-settings/uninstall.sh"
	sed -i 's|/usr/lib/waydroid/data/wd-settings-icon.png|waydroid-settings|;s|/usr/bin/waydroid-settings.sh|waydroid-settings|' \
		"$pkgdir/usr/share/applications/waydroid-settings.desktop" "$pkgdir/usr/share/applications/install-to-waydroid.desktop"
}
