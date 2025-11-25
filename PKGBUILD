# Maintainer: Mikata Riko <sanbikappa at qq dot com>

pkgname='netease-cloud-music-wine'
pkgver=3.1.23.204764
pkgrel=1
pkgdesc="NetEase Cloud Music Player. 使用wine运行网易云音乐windows官方包。"
arch=('x86_64')
license=('custom')
url="https://music.163.com/#/download"
depends=('wine' 'noto-fonts-cjk')
makedepends=('7zip')
#optdepends=('')
#conflicts=('')
install=.install
DLAGENTS=(
    'https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -A "Mozilla/5.0" -o %o %u'
)
source=(
    "https://d8.music.126.net/dmusic2/NeteaseCloudMusic_Music_official_${pkgver}_32.exe"
    "LICENSE"
)
sha256sums=(
    "d1bdc56accd19ce7fbd2817c16d4ea27578e0b5bd108040640726e9bf7f9f84b"
    "e6fa7eb9853b955c49cba5f5fbd83bf8039235d5c0d3eeaac81c2e99b0b7ff81"
)

prepare() {
    cd "${srcdir}"
    cat > install.sh << 'EOF'
#!/bin/bash

# prevent running by root/sudo
# refer Wine official FAQ, do not run wine with sudo or root permission.
if [[ $(id -u) -eq 0 ]];
then
    echo "ERROR: you should not use root/sudo to run this application."
    echo "ERROR: prevent running by root/sudo"
    exit 1
fi

if [[ -z "${WINEPREFIX}" ]];
then
    echo "\$WINEPREFIX not set." >&2
    exit
else
    rm -rf "${WINEPREFIX}"
fi
mkdir -p "${WINEPREFIX}"

# only setup wineprefix and do nothing
wine cmd /C

# not necessary to update WINEPREFIX automatically every time
echo "disable" > "$WINEPREFIX/.update-timestamp"

mkdir -p "${WINEPREFIX}/drive_c/NetEase"
ln -sfn /opt/netease-cloud-music-wine/NetEase/CloudMusic "${WINEPREFIX}/drive_c/NetEase/CloudMusic"
wine regedit "/opt/netease-cloud-music-wine/netease-cloud-music.reg"
cp -f /opt/netease-cloud-music-wine/netease-cloud-music.version "${WINEPREFIX}"/netease-cloud-music.version

EOF


    cat > run.sh << 'EOF'
#!/bin/bash

# prevent running by root/sudo
# refer Wine official FAQ, do not run wine with sudo or root permission.
if [[ $(id -u) -eq 0 ]];
then
    echo "ERROR: you should not use root/sudo to run this application."
    echo "ERROR: prevent running by root/sudo"
    exit 1
fi

if [[ -n "${XDG_CACHE_HOME}" ]];
then
    SETUP_DIR="${XDG_CACHE_HOME}"/netease-cloud-music-wine
else
    SETUP_DIR="${HOME}"/.cache/netease-cloud-music-wine
fi

mkdir -p "${SETUP_DIR}"/prefix

export WINEPREFIX="${SETUP_DIR}"/prefix

# prevent wine setting up application menu
# disable gecko override
# disable mono override
export WINEDLLOVERRIDES="winemenubuilder.exe=d;mshtml,mscoree="

# prevent wine showing noisy debug message.
if [[ -z "${WINEDEBUG}" ]];
then
    export WINEDEBUG=-all
fi

if [[ ! -f "${WINEPREFIX}/drive_c/NetEase/CloudMusic/cloudmusic.exe" ]];
then
    echo "First run, setup wineprefix."
    /opt/netease-cloud-music-wine/install.sh
fi

version_package="$(cat /opt/netease-cloud-music-wine/netease-cloud-music.version 2>/dev/null)"
version_local="$(cat "${WINEPREFIX}"/netease-cloud-music.version 2>/dev/null)"
if [[ "${version_local}" != "${version_package}" ]];
then
    echo "Version updated, update wineprefix."
    rm -f "${WINEPREFIX}"/*.reg
    /opt/netease-cloud-music-wine/install.sh
fi

wine "C:\\Netease\\CloudMusic\\cloudmusic.exe" "$@"
wineserver -k

EOF


    cat > netease-cloud-music.desktop << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=NetEase Cloud Music
Name[zh_CN]=网易云音乐
Name[zh_TW]=網易雲音樂
Comment=NetEase Cloud Music
Comment[zh_CN]=网易云音乐
Comment[zh_TW]=網易雲音樂
Icon=netease-cloud-music
Exec=/usr/bin/cloudmusic %U
Categories=AudioVideo;Player;
Terminal=false
StartupNotify=true
StartupWMClass=netease-cloud-music
MimeType=audio/aac;audio/flac;audio/mp3;audio/mp4;audio/mpeg;audio/ogg;audio/x-ape;audio/x-flac;audio/x-mp3;audio/x-mpeg;audio/x-ms-wma;audio/x-vorbis;audio/x-vorbis+ogg;audio/x-wav;
EOF


    cat > temp.txt << 'EOF'
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.aac]
@="cloudmusic.aac"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.aac\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.aac\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.aac\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.aac\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ape]
@="cloudmusic.ape"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ape\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ape\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ape\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ape\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cda]
@="cloudmusic.cda"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cda\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cda\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cda\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cda\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cue]
@="cloudmusic.cue"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cue\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cue\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cue\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.cue\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.flac]
@="cloudmusic.flac"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.flac\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.flac\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.flac\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.flac\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.m4a]
@="cloudmusic.m4a"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.m4a\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.m4a\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.m4a\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.m4a\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.mp3]
@="cloudmusic.mp3"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.mp3\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.mp3\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.mp3\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.mp3\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ncm]
@="cloudmusic.ncm"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ncm\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ncm\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ncm\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ncm\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ogg]
@="cloudmusic.ogg"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ogg\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ogg\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ogg\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.ogg\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wav]
@="cloudmusic.wav"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wav\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wav\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wav\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wav\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wma]
@="cloudmusic.wma"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wma\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\resource\\format.ico,0"
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wma\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wma\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\cloudmusic.wma\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--play=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Classes\orpheus]
"URL Protocol"=""
[HKEY_LOCAL_MACHINE\Software\Classes\orpheus\DefaultIcon]
@="C:\\NetEase\\CloudMusic\\cloudmusic.exe,0"
[HKEY_LOCAL_MACHINE\Software\Classes\orpheus\shell]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\orpheus\shell\open]
@=""
[HKEY_LOCAL_MACHINE\Software\Classes\orpheus\shell\open\command]
@="\"C:\\NetEase\\CloudMusic\\cloudmusic.exe\"--webcmd=\"%1\""
[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\cloudmusic.exe]
@="C:\\NetEase\\CloudMusic\\cloudmusic.exe"
[HKEY_LOCAL_MACHINE\Software\Wow6432Node\Netease]
[HKEY_LOCAL_MACHINE\Software\Wow6432Node\Netease\cloudmusic]
"install_dir"="C:\\NetEase\\CloudMusic"
"version"="3.1.22.204707"


[HKEY_CURRENT_USER\Software\Wine\Fonts\Replacements]
"Batang"="Noto Sans CJK KR"
"BatangChe"="Noto Sans CJK KR"
"Dengxian"="Noto Sans CJK SC"
"DFKai-SB"="Noto Sans CJK TC"
"Dotum"="Noto Sans CJK KR"
"DotumChe"="Noto Sans CJK KR"
"FangSong"="Noto Sans CJK SC"
"Gulim"="Noto Sans CJK KR"
"GulimChe"="Noto Sans CJK KR"
"Gungsuh"="Noto Sans CJK KR"
"GungsuhChe"="Noto Sans CJK KR"
"KaiTi"="Noto Sans CJK SC"
"Malgun Gothic"="Noto Sans CJK KR"
"Meiryo"="Noto Sans CJK JP"
"Meiryo UI"="Noto Sans CJK JP"
"Microsoft JhengHei"="Noto Sans CJK TC"
"Microsoft JhengHei UI"="Noto Sans CJK TC"
"Microsoft YaHei"="Noto Sans CJK SC"
"Microsoft YaHei UI"="Noto Sans CJK SC"
"MingLiU"="Noto Sans CJK TC"
"MingLiU-ExtB"="Noto Sans CJK TC"
"MS Gothic"="Noto Sans CJK JP"
"MS Mincho"="Noto Sans CJK JP"
"MS PGothic"="Noto Sans CJK JP"
"MS PMincho"="Noto Sans CJK JP"
"MS UI Gothic"="Noto Sans CJK JP"
"NSimSun"="Noto Sans CJK SC"
"PMingLiU"="Noto Sans CJK TC"
"PMingLiU-ExtB"="Noto Sans CJK TC"
"SimHei"="Noto Sans CJK SC"
"SimKai"="Noto Sans CJK SC"
"SimSun"="Noto Sans CJK SC"
"SimSun-ExtB"="Noto Sans CJK SC"
"UD Digi KyoKasho N-R"="Noto Sans CJK JP"
"UD Digi KyoKasho NK-R"="Noto Sans CJK JP"
"UD Digi KyoKasho NP-R"="Noto Sans CJK JP"
"Yu Gothic"="Noto Sans CJK JP"
"Yu Gothic UI"="Noto Sans CJK JP"
"Yu Mincho"="Noto Sans CJK JP"
"メイリオ"="Noto Sans CJK JP"
"굴림"="Noto Sans CJK KR"
"굴림체"="Noto Sans CJK KR"
"돋움"="Noto Sans CJK KR"
"돋움체"="Noto Sans CJK KR"
"맑은 고딕"="Noto Sans CJK KR"
"바탕"="Noto Sans CJK KR"
"바탕체"="Noto Sans CJK KR"
"ＭＳ ゴシック"="Noto Sans CJK JP"
"ＭＳ 明朝"="Noto Sans CJK JP"

EOF

    printf '\xFF\xFE' > netease-cloud-music.reg
    iconv -f UTF-8 -t UTF-16LE temp.txt >> netease-cloud-music.reg
    rm temp.txt

    echo "${pkgver}" > netease-cloud-music.version

    chmod +x install.sh run.sh

}

package() {
    #cd "${srcdir}"
    rm -rf temp temp1 NetEase
    mkdir -p "${srcdir}"/temp
    mkdir -p "${srcdir}"/temp1
    7z x *.exe -otemp
    7z x "${srcdir}"/temp/redist_packages/cloudmusic.exe -o"${srcdir}"/temp1
    cp "${srcdir}"/temp1/.rsrc/2052/ICON/9 "${srcdir}"/netease-cloud-music.png

    TEMP_PROGRAM_FILES="${srcdir}/NetEase/CloudMusic"
    mkdir -p "${TEMP_PROGRAM_FILES}"
    mv temp/{locales,package,resource,swiftshader} "${TEMP_PROGRAM_FILES}"

    mkdir -p "${TEMP_PROGRAM_FILES}"/redist_packages
    cd "${srcdir}"/temp/redist_packages
    mv api-ms-win*.dll "${TEMP_PROGRAM_FILES}"/redist_packages
    mv {apisetschema,concrt140,msvcp140,msvcp140_1,msvcp140_2,ucrtbase,vccorlib140,vcruntime140}.dll "${TEMP_PROGRAM_FILES}"/redist_packages
    mv * "${TEMP_PROGRAM_FILES}"
    cd "${srcdir}"
    rmdir "${srcdir}"/temp/redist_packages

    mkdir -p "${pkgdir}"/opt/netease-cloud-music-wine
    cd "${srcdir}"
    mv NetEase "${pkgdir}"/opt/netease-cloud-music-wine
    mv install.sh run.sh "${pkgdir}"/opt/netease-cloud-music-wine
    mv netease-cloud-music.reg "${pkgdir}"/opt/netease-cloud-music-wine
    mv netease-cloud-music.version "${pkgdir}"/opt/netease-cloud-music-wine
    mkdir -p "${pkgdir}"/usr/share/pixmaps
    mv netease-cloud-music.png "${pkgdir}"/usr/share/pixmaps
    mkdir -p "${pkgdir}"/usr/share/applications
    mv netease-cloud-music.desktop "${pkgdir}"/usr/share/applications
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/netease-cloud-music-wine/run.sh "${pkgdir}"/usr/bin/netease-cloud-music-wine
    ln -s /opt/netease-cloud-music-wine/run.sh "${pkgdir}"/usr/bin/cloudmusic

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

