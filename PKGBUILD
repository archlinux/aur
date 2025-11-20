# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: snemc snemc @3112671039@qq.com
pkgname=umi-ocr-bin
_pkgname=Umi-OCR
pkgver=2.1.5
pkgrel=2
pkgdesc="Free, Open-source, Batch Offline OCR Software.(Prebuilt version)开源、免费的离线OCR软件。支持截屏/批量导入图片，PDF文档识别，排除水印/页眉页脚，扫描/生成二维码。内置多国语言库"
arch=('x86_64')
url="https://github.com/hiroi-sora/Umi-OCR"
license=('MIT')
depends=(
    'pyside6'
    'python-pymupdf>=1.23'
    'python-fonttools>=4.47'
    'python-pillow>=10.2'
    'python-psutil>=5.9'
    'python-pynput'
    'qt6-webengine'
    'python-wheel'
    'python-defusedxml'
    'python-attrs'
    'libxrandr'
    'gdk-pixbuf2'
    'python-brotli'
    'libxcomposite'
    'libxcrypt-compat'
    'python-setuptools'
    'python-pyqt6'
    'python-tornado'
    'openssl-1.1'
    'python-reportlab'
    'unixodbc'
    'libpulse'
    'python-typing_extensions'
    'python-opengl'
    'python-jinja'
    'python-wxpython'
    'qt5-tools'
    'python-pyqt5'
    'python-cairo'
    'qt6-multimedia'
    'postgresql-libs'
    'python-simplejson'
    'python-cryptography'
    'python-lz4'
    'python-mako'
    'qt6-quick3d'
    'python-lxml'
    'python-pip'
    'qt6-charts'
    'python-pyopenssl'
    'python-cffi'
    'python-docutils'
    'python-requests'
    'qt6-webengine'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
)
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_Paddle_${pkgver}.tar.xz")
sha256sums=('7ff32e5dc818d67171820545100433c86e7e71155f9bad0851fad2ced9588f9b')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="/usr/lib/${pkgname%-bin}/${pkgname%-bin}.sh"
    find "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}" -type f -perm 600 -exec chmod 644 {} +
    sed -i "s/UPLOAD_DIR = \".\/temp_doc\"/UPLOAD_DIR = os.path.join(os.environ.get(\'XDG_CACHE_HOME\', os.path.expanduser(\'~\/.cache\')), \'umi-ocr\')/g" \
        "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/UmiOCR-data/py_src/server/doc_server.py"
    sed -i -e "
        32i\from pathlib import Path
        /# 日志保存目录/a \# 使用XDG标准目录\nconfig_dir = os.environ.get('XDG_CONFIG_HOME', os.path.expanduser('~\/.config'))
        s/Logs_Dir = \".\/logs\"/Logs_Dir = os.path.join(config_dir, \"umi-ocr\", \"logs\")/g
        /def open_logs_dir():/,/os.startfile(Logs_Dir)/ {
            /def open_logs_dir():/a \    import subprocess
            /os.startfile(Logs_Dir)/c \    subprocess.Popen(['xdg-open', Logs_Dir])
        }
    " "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/UmiOCR-data/py_src/imports/umi_log.py"
    sed -i -e "
        6i\from pathlib import Path
        7i\# 使用XDG标准目录\nconfig_dir = os.environ.get('XDG_CONFIG_HOME', os.path.expanduser('~\/.config'))
        s/_FileName = \".\/\.pre_settings\"/_FileName = os.path.join(config_dir, \"umi-ocr\", \".pre_settings\")/g
    " "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/UmiOCR-data/py_src/utils/pre_configs.py"
    # 修改 global_configs_connector.py 跳过写权限检查
    sed -i 's/if not os.access(cwd, os.W_OK):/# 跳过写权限检查，因为程序已经修改了所有需要写权限的路径\n        #if not os.access(cwd, os.W_OK):/g' \
        "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/UmiOCR-data/py_src/utils/global_configs_connector.py"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/docs/images/icon-256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_Paddle_${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}