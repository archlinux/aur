# Maintainer: Tblue <tilman (at) ax86 (dot) net>
# Contributor: lanrat

pkgname='fortune-mod-bofh-excuses'
pkgver=20151113.024512
pkgrel=1
pkgdesc='BOFH excuses fortune cookie files'
arch=('any')
url='http://www.cs.wisc.edu/~ballard/bofh/'
depends=('fortune-mod')
makedepends=('curl')
groups=('fortune-mods')
license=('Public domain')

_dlurl='http://pages.cs.wisc.edu/~ballard/bofh/excuses'

pkgver()
{
    # Make a HTTP HEAD request and use the Last-Modified header of the data file
    # to generate the pkgver. Thanks to djmattyg007 for the idea (and the hint that
    # the Debian package I used previously is somewhat outdated by now :-)!
    local lastmod=$(curl -sS -fL -I "${_dlurl}" | tac | sed -n '/^Last-modified:[[:space:]]*/I { s///p; q }')

    if [ -z "$lastmod" ]; then
        return 1
    fi

    date -ud "${lastmod}" '+%Y%m%d.%H%M%S'
}

prepare()
{
    # Okay, this may not be the ideal place to download the data file,
    # but we DO want to update it on every run -- if we let makepkg
    # download it for us, it will not be re-downloaded if it already
    # exists locally (and that would be bad since the data file could
    # have been updated on the server since the last download).
    #
    # Instead, we instruct curl to only download the file if it is
    # newer than the local copy (if it exists).

    msg2 "Downloading data file..."
    curl -fL -Ro "${srcdir}/bofh-excuses.raw" -z "${srcdir}/bofh-excuses.raw" "${_dlurl}"
}

build()
{
    cd "${srcdir}"

    awk '{ printf "BOFH excuse #%d:\n\n%s\n%%\n", FNR, $0 }' \
        bofh-excuses.raw > bofh-excuses
    strfile ./bofh-excuses
}

package()
{
    cd "${srcdir}"
    
    install -D -m644 bofh-excuses "${pkgdir}/usr/share/fortune/bofh-excuses"
    install -D -m644 bofh-excuses.dat "${pkgdir}/usr/share/fortune/bofh-excuses.dat"
}
