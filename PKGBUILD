#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Matomo.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="matomo"
declare -r _tag="7da5cc0c383f3a1727125d3270ef12a03293dc54"

pkgname="matomo-git"
pkgver="4.14.2"
pkgrel="1"
pkgdesc="A powerful web analytics platform."
arch=("any")
url="https://github.com/matomo-org/${_pkgname}"
license=("GPL3")
depends=("alsa-lib" "at-spi2-core" "bash" "coffeescript" "gtk3" "java-runtime" "lib32-glibc" "mariadb" "nodejs" "nss" "perl" "php" "php-fpm" "php-gd" "python" "python-beautifulsoup4" "python-pillow" "python-requests" "python-yaml" "rhino" "ruby" "zsh")
makedepends=("composer" "curl" "git" "git-lfs" "npm")
optdepends=("apache: HTTP server"
    "certbot: Creates SSL certificates."
    "nginx: HTTP server")
provides=("${_pkgname}")
conflicts=("matomo")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git#tag=${_tag}"
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
    "override_${_pkgname}.conf")
sha512sums=("SKIP"
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
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
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

    # GeoIP database
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

    curl -o "${srcdir}"/DBIP-City-Lite.mmdb.gz https://download.db-ip.com/free/dbip-city-lite-"${_current_year}"-"${_current_month}".mmdb.gz
    gzip -d "${srcdir}"/DBIP-City-Lite.mmdb.gz
}

build()
{
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    composer install --no-dev

    declare -r _package_jsons="$(find "${srcdir}"/"${_pkgname}"/ -name package.json -type f)"
    readarray -t _package_json_array <<< "${_package_jsons}"

    for _package_json in "${_package_json_array[@]}"; do
        if [[ "${_package_json}" != "${srcdir}"/"${_pkgname}"*/node_modules/* ]]; then
            cd "$(dirname "${_package_json}")" || exit 1
            npm install
        fi
    done
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/lib/systemd/system/php-fpm.service.d/
    mkdir -p "${pkgdir}"/usr/share/doc/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${_pkgname}"/misc/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"/ "${pkgdir}"/usr/share/webapps/
    install -Dm644 "${srcdir}"/DBIP-City-Lite.mmdb "${pkgdir}"/usr/share/webapps/"${_pkgname}"/misc/
    install -Dm644 "${srcdir}"/override_"${_pkgname}".conf "${pkgdir}"/usr/lib/systemd/system/php-fpm.service.d/
    chown -R http:http "${pkgdir}"/usr/share/webapps/"${_pkgname}"/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/
}
