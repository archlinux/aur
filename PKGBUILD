# Maintainer: falser <zjf_0731 at 163 dot com>
# Contributor: Allen Zhong <pdev@zhoal.pw>
# Contributor: Xuanwo <github@xuanwo.io>
# Contributor: Zhou Zhiqiang <aur@strrl.dev>
# Contributor: Feishu Linux Team <contact@feishu.cn>
pkgname=feishu-follow-system
pkgver=7.72.23
_pkgtyp=stable
_pkghash_x64=fc38d53a
_pkghash_arm64=8d668c7a
pkgrel=1
pkgdesc="Feishu (Lark) Linux client with follow-system color scheme"
arch=('x86_64' 'aarch64')
url="https://www.feishu.cn/"
license=('unknown')
depends=('ca-certificates' 'gtk3' 'nss' 'xdg-utils')
makedepends=('python')
conflicts=('feishu' 'feishu-bin' 'bytedance-feishu-stable-bin')
provides=('feishu' 'bytedance-feishu')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=('enable-follow-system.py' 'linux-theme-preload.c')
source_x86_64=("https://sf3-cn.feishucdn.com/obj/ee-appcenter/${_pkghash_x64}/Feishu-linux_x64-${pkgver}.deb")
source_aarch64=("https://sf3-cn.feishucdn.com/obj/ee-appcenter/${_pkghash_arm64}/Feishu-linux_arm64-${pkgver}.deb")
sha256sums=('4d69b26ff781c02426c6a7420e97ba771cd1ba02426b177ef3361889f37c342e'
            '22c1a9e2d6685f37790e29d905ac7a99d57a7a01e7a9e80c47e086ad2716fa4f')
sha256sums_x86_64=('7c744ce101e29f50d8d0fc099788b64cb389dde3178178a7fce9ffcdbf296e13')
sha256sums_aarch64=('8052d22189546438e24b3691d64871805961ecea7a45804c75a2960ed2b8710e')

package(){
  tar xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"

  python "${srcdir}/enable-follow-system.py" \
    "${pkgdir}/opt/bytedance/feishu"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  if [[ "$CARCH" == x86_64 ]]; then
    cc -shared -fPIC -O2 -pthread \
      -o "${pkgdir}/usr/lib/${pkgname}/libfeishu_linux_theme.so" \
      "${srcdir}/linux-theme-preload.c" \
      -ldl
  fi

  cd "${pkgdir}"
  cat << EOF > usr/bin/feishu
#!/bin/bash

XDG_CONFIG_HOME=\${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f \$XDG_CONFIG_HOME/feishu-flags.conf ]]; then
    FEISHU_USER_FLAGS="\$(grep -v '^#' \$XDG_CONFIG_HOME/feishu-flags.conf)"
fi

exec /usr/bin/bytedance-feishu-${_pkgtyp} \$FEISHU_USER_FLAGS "\$@"
EOF
  chmod +x usr/bin/feishu

  sed -i "s/bytedance-feishu-${_pkgtyp}/feishu/g" "${pkgdir}/usr/share/applications/bytedance-feishu.desktop"
  sed -i 's/StartupNotify=true/StartupNotify=true\nStartupWMClass=feishu/g' "${pkgdir}/usr/share/applications/bytedance-feishu.desktop"

  sed -i "s/bytedance-feishu-${_pkgtyp}/feishu/g" "${pkgdir}/usr/share/menu/bytedance-feishu.menu"
  sed -i "s/bytedance-feishu/feishu/g" "${pkgdir}/usr/share/menu/bytedance-feishu.menu"

  sed -i 's/bytedance-feishu/feishu/g' "${pkgdir}/usr/share/appdata/bytedance-feishu.appdata.xml"

  sed -i "s/bytedance-feishu-${_pkgtyp}/feishu/g" "${pkgdir}/opt/bytedance/feishu/bytedance-feishu"

  if [[ "$CARCH" == x86_64 ]]; then
    sed -i '/^export LD_LIBRARY_PATH/a \
THEME_SO=/usr/lib/'"${pkgname}"'/libfeishu_linux_theme.so\
if [ -f "$THEME_SO" ]; then\
  export LD_PRELOAD="$THEME_SO${LD_PRELOAD:+:$LD_PRELOAD}"\
fi' "${pkgdir}/opt/bytedance/feishu/bytedance-feishu"
  fi

  mv "${pkgdir}"/usr/share/menu/{bytedance-,}feishu.menu
  mv "${pkgdir}"/usr/share/applications/{bytedance-,}feishu.desktop
  mv "${pkgdir}"/usr/share/appdata/{bytedance-,}feishu.appdata.xml
  mv "${pkgdir}"/usr/share/man/man1/{bytedance-feishu-${_pkgtyp},feishu}.1.gz
  mv "${pkgdir}"/usr/share/doc/{bytedance-feishu-${_pkgtyp},feishu}

  find "${pkgdir}" -type d | xargs chmod 755
}
