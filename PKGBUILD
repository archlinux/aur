# Maintainer: John <john@example.com>
pkgname=arr-trailer-dl-git
pkgver=r48.9bb274a
pkgrel=1
pkgdesc="Python script that downloads trailers from YouTube for Radarr/Sonarr libraries"
arch=('any')
url="https://github.com/DamienDessagne/Arr-TrailerDownloader"
license=('GPL-3.0-or-later')
depends=('python' 'python-requests' 'yt-dlp')
makedepends=('git')
optdepends=('ffmpeg: video re-encoding support')
provides=('arr-trailer-dl')
conflicts=('arr-trailer-dl')
install=arr-trailer-dl.install
source=("${pkgname}::git+https://github.com/DamienDessagne/Arr-TrailerDownloader.git"
        "arr-trailer-dl.sysusers"
        "arr-trailer-dl.tmpfiles"
        "patch_search.py")
sha256sums=('SKIP'
            'd4cc1fb49471a475690e652799a1408e25324d068ca6ecd98b4e56590c3ce68c'
            '343f046b701d70467e38f906d8a072b721504259d547687369c30a896f78a338'
            'd5e23a4b88f5f47837983f757ac41ce93f60ba3a2b3b5fc145cd103de419db6a')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${pkgname}"

	# Add shebang
	sed -i '1s|^|#!/usr/bin/env python\n|' TrailerDownloader.py

	# Remove chdir() so paths are no longer anchored to the script directory
	sed -i "/os\.chdir(os\.path\.dirname/d" TrailerDownloader.py

	# Fix upstream bug in config.ini where [ReencodeRules] bleeds into search_keywords
	sed -i 's/trailer\[ReencodeRules\]/trailer/' config.ini

	# Disable firefox cookies by default since the service user won't have a browser profile
	sed -i 's/^yt_dlp_cookies_browser = firefox/yt_dlp_cookies_browser =/' config.ini
	sed -i 's/# 	supported values at the time of writing this/# 	supported values at the time of writing this\n# NOTE: This only works if you run the script as the user who owns the browser profile.\n# If running headless as the radarr\/sonarr service user, leave this blank./' config.ini

	# Point config to /var/lib/arr-trailer-dl
	sed -i "s|os\.path\.join(os\.path\.dirname(os\.path\.abspath(__file__)), 'config\.ini')|'/var/lib/arr-trailer-dl/config.ini'|" \
		TrailerDownloader.py

	# Point logs to /var/lib/arr-trailer-dl/logs
	sed -i "s|LOG_FOLDER_NAME = \"Logs\"|LOG_FOLDER_NAME = '/var/lib/arr-trailer-dl/logs'|" \
		TrailerDownloader.py

	# Apply smart fallback to yt-dlp search if API key fails or is missing
	python "${srcdir}/patch_search.py"
}

package() {
	cd "${pkgname}"

	# Install the patched script
	install -Dm755 TrailerDownloader.py \
		"${pkgdir}/usr/lib/arr-trailer-dl/TrailerDownloader.py"

	# Install default config as an example file so pacman doesn't overwrite the user's live config
	install -Dm644 config.ini \
		"${pkgdir}/usr/share/arr-trailer-dl/config.ini.example"

	# Install license
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# systemd-sysusers and systemd-tmpfiles
	install -Dm644 "${srcdir}/arr-trailer-dl.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/arr-trailer-dl.conf"
	install -Dm644 "${srcdir}/arr-trailer-dl.tmpfiles" \
		"${pkgdir}/usr/lib/tmpfiles.d/arr-trailer-dl.conf"
}
