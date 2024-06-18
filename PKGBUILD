# Maintainer: Yongchun Jiang <JSpringYC@gmail.com>

pkgname=1panel-stable-bin
pkgver=v1.10.10_lts
pkgrel=1
pkgdesc="1Panel is a modern and open source Linux panel."
arch=("x86_64" "aarch64")
url="https://1panel.cn"
license=("GPL-3.0-or-later")
options=("!debug")

optdepends=(
	"ufw"            # Firewall manager
	"firewalld"      # Firewall manager
	"docker"         # Docker image manager
	"docker-compose" # Docker compose plugin, make sure 1Panel app store works.
)
conflicts=(
	"1panel"
	"1panel-bin"
	"1panel-dev-bin"
	"1panel-git"
)

source=()
sha256sums=()

# install mode
_1panel_pkg_mode="stable"
_1panel_pkg_arch=""
_1panel_pkg_basename=""
_1panel_pkg_name=""
_1panel_pkg_version=""
_1panel_pkg_url=""
_1panel_pkg_hash_url=""
_1panel_pkg_hash=""

pkgver() {
	_1panel_pkg_version=$(curl -s https://resource.fit2cloud.com/1panel/package/${_1panel_pkg_mode}/latest)
	echo "${_1panel_pkg_version/-/_}"
}

_1panel_pkginfo() {
	if [[ "$CARCH" == "x86_64" ]]; then
		_1panel_pkg_arch="amd64"
	elif [[ "$CARCH" == "aarch64" ]]; then
		_1panel_pkg_arch="arm64"
	else
		echo "暂不支持的系统架构，请参阅官方文档，选择受支持的系统。"
		exit 1
	fi
	_1panel_pkg_version="${pkgver/_/-}"
	_1panel_pkg_basename="1panel-$_1panel_pkg_version-linux-$_1panel_pkg_arch"
	_1panel_pkg_name="${_1panel_pkg_basename}.tar.gz"
	_1panel_pkg_url="https://resource.fit2cloud.com/1panel/package/$_1panel_pkg_mode/$_1panel_pkg_version/release/$_1panel_pkg_name"
	_1panel_pkg_hash_url="https://resource.fit2cloud.com/1panel/package/$_1panel_pkg_mode/$_1panel_pkg_version/release/checksums.txt"
}

build() {
	_1panel_pkginfo

	echo "build - pkg_name: $_1panel_pkg_name"
	# 检测安装包是否存在
	_temp_pkg_exists=0
	if [ -f ${_1panel_pkg_name} ]; then
		_1panel_pkg_hash=$(curl -s "$_1panel_pkg_hash_url" | grep "$_1panel_pkg_name" | awk '{print $1}')
		_temp_pkg_hash=$(sha256sum "$_1panel_pkg_name" | awk '{print $1}')
		if [[ "$_temp_pkg_hash" == "$_1panel_pkg_hash" ]]; then
			echo "安装包已存在，跳过下载"
			_temp_pkg_exists=1
		else
			echo "已存在安装包，但是哈希值不一致，开始重新下载"
			rm -f ${_1panel_pkg_name}
		fi
	fi
	# 下载安装包
	if [[ $_temp_pkg_exists == 0 ]]; then
		curl -LOk -o ${_1panel_pkg_name} ${_1panel_pkg_url}
		curl -sfL https://resource.fit2cloud.com/installation-log.sh | sh -s 1p install $_1panel_pkg_version
	fi
	if [ ! -f ${_1panel_pkg_name} ]; then
		echo "下载安装包失败，请稍候重试。"
		exit 1
	else
		if [ -d $_1panel_pkg_basename ]; then
			rm -rf $_1panel_pkg_basename
		fi
		tar zxvf ${_1panel_pkg_name}
	fi
}

package() {
	_1panel_pkginfo

	install -vd $pkgdir/opt/1panel
	install -vDm755 $srcdir/$_1panel_pkg_basename/1panel $pkgdir/usr/bin/1panel
	install -vDm755 $srcdir/$_1panel_pkg_basename/1pctl $pkgdir/usr/bin/1pctl
	install -vDm644 $srcdir/$_1panel_pkg_basename/1panel.service -t $pkgdir/usr/lib/systemd/system
	install -vDm644 $srcdir/$_1panel_pkg_basename/LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
