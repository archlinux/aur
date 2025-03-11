# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=texlive-full
pkgver=2025.20250310
pkgrel=1
epoch=1
pkgdesc="This package provides texlive-full in /opt. It also tricks Arch Linux into thinking it has its texlive packages installed."
url="http://www.tug.org/texlive/"
arch=("x86_64")
license=('custom')
makedepends=('rsync')
depends=('libxcrypt-compat' 'asymptote' 'psutils' 't1utils')
provides=(git-latexdiff
texlive-basic texlive-bibtexextra texlive-bin texlive-binextra
texlive-context texlive-core texlive-doc
texlive-fontsextra texlive-fontsrecommended texlive-fontutils texlive-formatsextra
texlive-games texlive-htmlxml texlive-humanities
texlive-langarabic texlive-langchinese texlive-langcjk texlive-langcyrillic
texlive-langczechslovak texlive-langenglish
texlive-langeuropean texlive-langfrench texlive-langgerman texlive-langgreek
texlive-langitalian texlive-langjapanese texlive-langkorean texlive-langother
texlive-langpolish texlive-langportuguese texlive-langspanish
texlive-latex texlive-latexextra texlive-latexrecommended texlive-luatex
texlive-mathscience texlive-metapost texlive-music
texlive-pictures texlive-plaingeneric texlive-pstricks texlive-publishers
texlive-science texlive-xetex
)
conflicts=(git-latexdiff
texlive-basic texlive-bibtexextra texlive-bin texlive-binextra
texlive-context texlive-core texlive-doc
texlive-fontsextra texlive-fontsrecommended texlive-fontutils texlive-formatsextra
texlive-games texlive-htmlxml texlive-humanities
texlive-langarabic texlive-langchinese texlive-langcjk texlive-langcyrillic
texlive-langczechslovak texlive-langenglish
texlive-langeuropean texlive-langfrench texlive-langgerman texlive-langgreek
texlive-langitalian texlive-langjapanese texlive-langkorean texlive-langother
texlive-langpolish texlive-langportuguese texlive-langspanish
texlive-latex texlive-latexextra texlive-latexrecommended texlive-luatex
texlive-mathscience texlive-metapost texlive-music
texlive-pictures texlive-plaingeneric texlive-pstricks texlive-publishers
texlive-science texlive-xetex
)
source=("install-tl-unx-${pkgver}.tar.gz::https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"
    "LICENSE.TL::https://tug.org/texlive/LICENSE.TL")
sha256sums=('SKIP'
            '8147ff504e6d7d89a7c42d5c3dfbaa8705ad17f72c82a5c1bce5f4f0ee8b2fb7')
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

_postfix(){
    # remove files provided by other packages
    # we do not link the executables from the depends to /opt/texlive/bin
    # as it's too complicated.

    cd ${pkgdir}
    # asymptote
    rm -rf usr/bin/{asy,xasy}
    rm -rf usr/share/info/asy-faq.info
    rm -rf usr/share/man/man1/{asy,xasy}.1

    # psutils
    rm -rf usr/bin/{epsffit,extractres,includeres,psbook,psjoin,psnup,psresize,psselect,pstops}
    rm -rf usr/share/man/man1/{epsffit,extractres,includeres,psbook,psjoin,psnup,psresize,psselect,pstops,psutils}.1

    # t1utils
    rm -rf usr/bin/{t1ascii,t1asm,t1binary,t1disasm,t1mac,t1unmac}
    rm -rf usr/share/man/man1/{t1ascii,t1asm,t1binary,t1disasm,t1mac,t1unmac}.1
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
    for mann in {1,5}
    do
        cd ${pkgdir}/opt/texlive/${_year}/texmf-dist/doc/man/man${mann}
        #  only link .1 and .5 files, not pdf
        find . -type f,l -name "*.${mann}" -print0 |sed "s|\./||g"| while read -d $'\0' man
        do
            ln -s "/opt/texlive/${_year}/texmf-dist/doc/man/man${mann}/${man}"  "${pkgdir}/usr/share/man/man${mann}/"
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

    _postfix
}
# vim:set ts=2 sw=2 et:
