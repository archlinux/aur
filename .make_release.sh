#!/bin/bash

make_release() {
    local CURRENT_VERSION
    local TARGET_VERSION
    local RELEASE_MESSAGE

    CURRENT_PKGVER=$(sed -n 's/pkgver=\(.*\)/\1/p' PKGBUILD | tr -d '"')
	CURRENT_PKGREL=$(sed -n 's/pkgrel=\(.*\)/\1/p' PKGBUILD)
    CURRENT_VERSION="${CURRENT_PKGVER}-${CURRENT_PKGREL}"
    TARGET_VERSION="${1}"
    shift
    RELEASE_MESSAGE="${1}"
    shift
    TARGET_PKGVER=$(echo "${TARGET_VERSION}" | cut -f1 -d '-')
    TARGET_PKGREL=$(echo "${TARGET_VERSION}" | cut -f2 -d '-')

    sed -i "s/^pkgver=.*$/pkgver=\"${TARGET_PKGVER}\"/" PKGBUILD
    sed -i "s/^pkgrel=.*$/pkgrel=${TARGET_PKGREL}/" PKGBUILD
    sed -i "s/^INTERNAL_VERSION=.*$/INTERNAL_VERSION=\"${TARGET_VERSION}\"/" aurx
    sed -i "s/^sha256sums=(.*)$/sha256sums=($(sha256sum aurx | cut -f1 -d ' '))/" PKGBUILD
    makepkg --printsrcinfo > .SRCINFO

    git add -A
    git commit -m "${TARGET_VERSION}: ${RELEASE_MESSAGE}." 
    git tag -a "${TARGET_VERSION}" -m "${TARGET_VERSION}: ${RELEASE_MESSAGE}."
    git push --tags
    git push
}

make_release "${@}"
