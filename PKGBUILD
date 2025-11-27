#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Matomo.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _tag="d4d44494ae3029427e6917aef6ddedb3e08928fc"

pkgname="matomo"
pkgver="5.6.1"
pkgrel="1"
pkgdesc="A powerful web analytics platform."
arch=("x86_64")
url="https://github.com/matomo-org/${pkgname}"
license=("GPL-3.0-or-later")
depends=("bash" "gcc-libs" "glibc" "lib32-glibc" "mariadb" "nodejs" "perl" "php" "php-gd" "python" "python-beautifulsoup4" "python-requests" "python-yaml" "rhino")
makedepends=("composer" "curl" "git" "git-lfs" "npm")
checkdepends=("alsa-lib" "at-spi2-core" "cairo" "coffeescript" "dbus" "expat" "glib2" "gtk3" "java-runtime" "libcups" "libdrm" "libx11" "libxcb" "libxcomposite" "libxdamage" "libxext" "libxfixes" "libxkbcommon" "libxrandr" "libxshmfence" "mesa" "nspr" "nss" "pango" "ruby")
optdepends=("apache: HTTP server."
    "certbot: Creates SSL certificates."
    "mod_fcgid: FastCGI."
    "nginx: HTTP server."
    "php-cgi: CGI."
    "php-fpm: FastCGI."
    "php-legacy-cgi: CGI."
    "php-legacy-fpm: FastCGI."
    "spawn-fcgi: FastCGI."
    "uwsgi-plugin-php: CGI."
    "uwsgi-plugin-php-legacy: CGI."
)
provides=("${pkgname}")
conflicts=("matomo-bin")
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git#tag=${_tag}"
    "git+https://github.com/matomo-org/matomo-icons.git"
    "git+https://github.com/matomo-org/matomo-log-analytics.git"
    "git+https://github.com/matomo-org/plugin-AnonymousPiwikUsageMeasurement.git"
    "git+https://github.com/matomo-org/plugin-Bandwidth.git"
    "git+https://github.com/matomo-org/plugin-CustomAlerts.git"
    "git+https://github.com/matomo-org/plugin-CustomVariables.git"
    "git+https://github.com/matomo-org/plugin-DeviceDetectorCache.git"
    "git+https://github.com/matomo-org/plugin-LoginLdap.git"
    "git+https://github.com/matomo-org/plugin-LogViewer.git"
    "git+https://github.com/matomo-org/plugin-MarketingCampaignsReporting.git"
    "git+https://github.com/matomo-org/plugin-Provider.git"
    "git+https://github.com/matomo-org/plugin-QueuedTracking.git"
    "git+https://github.com/matomo-org/plugin-SecurityInfo.git"
    "git+https://github.com/matomo-org/plugin-TasksTimetable.git"
    "git+https://github.com/matomo-org/plugin-TrackingSpamPrevention.git"
    "git+https://github.com/matomo-org/plugin-TreemapVisualization.git"
    "git+https://github.com/matomo-org/plugin-VisitorGenerator.git"
    "git+https://github.com/matomo-org/tag-manager.git"
    "git+https://github.com/matomo-org/travis-scripts.git"
    "override-${pkgname}.conf")
sha512sums=("b966a7b618f903a9ef565054f82183888fb7bca0de599ea76173a87e8dbfc32af548dbc01548a5f4a745cf4c55c5df2bb5ce99e5f9af23a55132e12acbfe7fc1"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "3802c7aae4c26cf23a61c48fedabe1d4bb516bbc07e42573cdb8cdfd19a556cc0b65941eae03ceb1c9cbf3eff2d40742e01eea12f3b420ae0d277c3582368b34")

prepare()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    git submodule init

    git config submodule.misc/log-analytics.url "${srcdir}"/matomo-log-analytics/
    git config submodule.plugins/AnonymousPiwikUsageMeasurement.url "${srcdir}"/plugin-AnonymousPiwikUsageMeasurement/
    git config submodule.plugins/Bandwidth.url "${srcdir}"/plugin-Bandwidth/
    git config submodule.plugins/CustomAlters.url "${srcdir}"/plugin-CustomAlters/
    git config submodule.plugins/CustomVariables.url "${srcdir}"/plugin-CustomVariables/
    git config submodule.plugins/DeviceDetectorCache.url "${srcdir}"/plugin-DeviceDetectorCache/
    git config submodule.plugins/LoginLdap.url "${srcdir}"/plugin-LoginLdap/
    git config submodule.plugins/LogViewer.url "${srcdir}"/plugin-LogViewer/
    git config submodule.plugins/MarketingCampaignsReporting.url "${srcdir}"/plugin-MarketingCampaignsReporting/
    git config submodule.plugins/Morpheus/icons.url "${srcdir}"/matomo-icons/
    git config submodule.plugins/Provider.url "${srcdir}"/plugin-Provider/
    git config submodule.plugins/QueuedTracking.url "${srcdir}"/plugin-QueuedTracking/
    git config submodule.plugins/SecurityInfo.url "${srcdir}"/plugin-SecurityInfo/
    git config submodule.plugins/TagManager.url "${srcdir}"/tag-manager/
    git config submodule.plugins/TasksTimetable.url "${srcdir}"/plugin-TasksTimetable/
    git config submodule.plugins/TrackingSpamPrevention.url "${srcdir}"/plugin-TrackingSpamPrevention/
    git config submodule.plugins/TreemapVisualization.url "${srcdir}"/plugin-TreemapVisualization/
    git config submodule.plugins/VisitorGenerator.url "${srcdir}"/plugin-VisitorGenerator/
    git config submodule.tests/travis.url "${srcdir}"/travis-scripts/

    git -c protocol.file.allow=always submodule update

    # Geolocation database
    ## Do not use option "-i" as it will remove the preceding "0".
    declare _current_year
    _current_year="$(date +"%Y")"
    declare _current_month
    _current_month="$(date +"%m")"

    while [[ "$(curl -o /dev/null/ -sw "%{http_code}" https://download.db-ip.com/free/dbip-city-lite-"${_current_year}"-"${_current_month}".mmdb.gz || true)" != "200" ]]; do
        ## Remove the preceding "0".
        if [[ "${_current_month::1}" -eq "0" ]]; then
            _current_month=${_current_month:1}
        fi

        ## Take the last month.
        if [[ "${_current_month}" -gt "1" ]]; then
            ((_current_month--))
        else
            ((_current_year--))
            _current_month="12"
        fi

        ## Put a "0" at the beginning again.
        if [[ "${#_current_month}" -eq "2" ]]; then
            _current_month="0${_current_month}"
        fi
    done

    curl -o "${srcdir}"/DBIP-City.mmdb.gz https://download.db-ip.com/free/dbip-city-lite-"${_current_year}"-"${_current_month}".mmdb.gz
    gzip -d "${srcdir}"/DBIP-City.mmdb.gz
}

build()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    composer install --no-dev

    declare -r _package_jsons="$(find "${srcdir}"/"${pkgname}"/ -name package.json -type f)"
    readarray -t _package_json_array <<< "${_package_jsons}"

    for _package_json in "${_package_json_array[@]}"; do
        if [[ "${_package_json}" != "${srcdir}"/"${pkgname}"*/node_modules/* ]]; then
            cd "$(dirname "${_package_json}")" || exit 1
            # TODO Not usable yet, https://github.com/matomo-org/matomo/issues/23667.
            #npm install --omit dev
            npm install
        fi
    done

    cd "${srcdir}"/"${pkgname}"/ || exit 1
    # TODO Node.js v16 is currently needed, https://github.com/matomo-org/matomo/issues/21440.
    #./console development:enable
    #./console vue:build
    ./console development:disable
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/lib/systemd/system/php-fpm.service.d/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${pkgname}"/misc/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"/ "${pkgdir}"/usr/share/webapps/
    install -Dm644 "${srcdir}"/DBIP-City.mmdb "${pkgdir}"/usr/share/webapps/"${pkgname}"/misc/
    install -Dm644 "${srcdir}"/override-"${pkgname}".conf "${pkgdir}"/usr/lib/systemd/system/php-fpm.service.d/
    chown -R http:http "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
