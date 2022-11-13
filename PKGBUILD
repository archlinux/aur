# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=texlive-full
pkgver=2022.20221031
pkgrel=1
epoch=1
pkgdesc="This packages provides texlive-full in /opt.  It also tricks ArchLinux into thinking it has its texlive packages installed."
url="http://www.tug.org/texlive/"
arch=("x86_64")
license=('custom')
makedepends=('rsync')
depends=('libxcrypt-compat')
provides=('asymptote' 'git-latexdiff'  'psutils' 't1utils'
'texlive-bin'
'texlive-bibtexextra'  'texlive-core' 'texlive-fontsextra'
'texlive-formatsextra' 'texlive-games' 'texlive-humanities' 'texlive-latexextra'
'texlive-music' 'texlive-pictures' 'texlive-pstricks' 'texlive-publishers'
'texlive-science'
#
# 'haskell-citeproc' is not provided, only citeproc-lua is provided.
'texlive-langchinese' 'texlive-langcyrillic' 'texlive-langextra'
'texlive-langgreek' 'texlive-langjapanese' 'texlive-langkorean' 'texlive-htmlxml')
conflicts=('asymptote' 'git-latexdiff' 'haskell-citeproc' 'psutils' 't1utils'
'texlive-bin'
'texlive-bibtexextra'  'texlive-core' 'texlive-fontsextra'
'texlive-formatsextra' 'texlive-games' 'texlive-humanities' 'texlive-latexextra'
'texlive-music' 'texlive-pictures' 'texlive-pstricks' 'texlive-publishers'
'texlive-science'
'texlive-langchinese' 'texlive-langcyrillic' 'texlive-langextra'
'texlive-langgreek' 'texlive-langjapanese' 'texlive-langkorean' 'texlive-htmlxml'
)
source=("install-tl-unx-${pkgver}.tar.gz::https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"
    "LICENSE.TL::https://tug.org/texlive/LICENSE.TL")
sha256sums=('SKIP'
            'e8f070b2d1a9bad00af9d6cb94e687f2120591d092c8dab8727249b70adc96d0')
#PKGEXT='.pkg.tar'
options=(!strip)

# You can choose a mirror and rsync directory here.
# _syncdir works as a local CTAN mirror (about 4.5GiB) for faster installation
# For mainland China, use
# mirrors.bfsu.edu.cn/CTAN/systems/texlive/tlnet/

_mirror='rsync.dante.ctan.org/CTAN/systems/texlive/tlnet/'
_syncdir="CTAN/tlnet"

pkgver(){
    local _tldate=$(ls  | grep -E '[0-9]+' -o | sort -r | head -1)
    local _year=$(cat ${srcdir}/install-tl-${_tldate}/release-texlive.txt| grep -E '[0-9]+' -o)
    echo "${_year}.${_tldate}"
}
prepare(){
    # TeXLive release year
    local _tldate=$(ls  | grep -E '[0-9]+' -o | sort -r | head -1)
    local _year=$(cat ${srcdir}/install-tl-${_tldate}/release-texlive.txt| grep -E '[0-9]+' -o)
    # creating a profile for unattened installation
    echo "selected_scheme scheme-full" > "${srcdir}/texlive.profile"
    echo "TEXDIR ${pkgdir}/opt/texlive/${_year}" >> "${srcdir}/texlive.profile"
    echo "TEXMFLOCAL ${pkgdir}/opt/texlive/texmf-local" >> "${srcdir}/texlive.profile"
    echo "TEXMFSYSCONFIG ${pkgdir}/opt/texlive/${_year}/texmf-config" >> "${srcdir}/texlive.profile"
    echo "TEXMFSYSVAR ${pkgdir}/opt/texlive/${_year}/texmf-var" >> "${srcdir}/texlive.profile"
    echo "TEXMFHOME ~/.config/texlive/texmf" >> "${srcdir}/texlive.profile"
    echo "TEXMFCONFIG ~/.config/texlive/${_year}/texmf-config" >> "${srcdir}/texlive.profile"
    echo "TEXMFVAR ~/.config/texlive/${_year}/texmf-var" >> "${srcdir}/texlive.profile"

    # syncing repository
    mkdir -p ${_syncdir}
    msg2 "Syncing local mirror"
    rsync -av --delete --info=progress2 --info=name0 rsync://${_mirror}  ${_syncdir}

}

package() {
    local _tldate=$(ls  | grep -E '[0-9]+' -o | sort -r | head -1)
    local _year=$(cat ${srcdir}/install-tl-${_tldate}/release-texlive.txt| grep -E '[0-9]+' -o)
    # find installer path automatically.
    local _installer_dir=install-tl-${_tldate}

    # start the installer and install
    local _timestamp=$(date "+%m%d%H%M")
    "${srcdir}/${_installer_dir}/install-tl" \
        -profile "${srcdir}/texlive.profile" -repository ${_syncdir} -logfile "/tmp/install-tl-${_timestamp}.log"

    msg2 'Stripping $srcdir'
    find ${pkgdir}/* -type f -print0 | xargs -0 sed -i "s|${srcdir}||g"

    msg2 'Stripping $pkgdir'
    find ${pkgdir}/* -type f -print0 | xargs -0 sed -i "s|${pkgdir}||g"

    msg2 "Linking manpage"
    mkdir -p ${pkgdir}/usr/share/man/{man1,man5}
    for mann in {man1,man5}
    do
        cd ${pkgdir}/opt/texlive/${_year}/texmf-dist/doc/man/$mann
        find . -type f,l  -print0 |sed "s|\./||g"| while read -d $'\0' man
        do
            ln -s "/opt/texlive/${_year}/texmf-dist/doc/man/$mann/${man}"  "${pkgdir}/usr/share/man/$mann/"
        done
    done

    msg2 "Linking info"
    cd ${pkgdir}/opt/texlive/${_year}/texmf-dist/doc/info/
    mkdir -p ${pkgdir}/usr/share/info
    find . -type f,l  -print0 |sed "s|\./||g"| while read -d $'\0' info
    do
        ln -s "/opt/texlive/${_year}/texmf-dist/doc/info/${info}" "${pkgdir}/usr/share/info/"
    done

    msg2 "Linking binary"
    cd ${pkgdir}/opt/texlive/${_year}/bin/${arch}-linux/
    mkdir -p ${pkgdir}/usr/bin
    find . -type f,l  -print0 |sed "s|\./||g"| while read -d $'\0' bin
    do
        ln -s "/opt/texlive/${_year}/bin/${arch}-linux/${bin}" "${pkgdir}/usr/bin/"
    done

    # remove profile file and installation log, and wrong man link.
    rm -rf ${pkgdir}/usr/bin/man
    rm -vf "${pkgdir}/opt/texlive/${_year}/tlpkg/texlive.profile"

    msg2 "Removing files for Windows"
    rm -rf ${pkgdir}/opt/texlive/${_year}/texmf-dist/scripts/context/stubs/{win64,mswin}/*
    find -H ${pkgdir} -name "*.bat" -print0 | xargs -0 rm -rf

    msg2 "Install license file"
    install -Dm644 "$srcdir"/LICENSE.TL "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.TL
}
# vim:set ts=2 sw=2 et:
