#! /bin/bash
#  (GPL3+) Alberto Salvia Novella (es20490446e.wordpress.com)


mainFunction () {
	updateInfoFile
	buildPackage
}


buildPackage () {
	removeBuildFiles
	makePackage
	removeBuildFiles
}


changeToThisProgramDir () {
	cd "$( dirname "${BASH_SOURCE[0]}" )"
}


makePackage () {
	if [ -f "/usr/share/pigz" ]; then
		pigzVar="COMPRESSGZ=(pigz -c -f -n)"
	fi

	config="PKGEXT='.pkg.tar.gz' ${pigzVar}"
	silently "makePackage" "${config} makepkg --force"
}


removeBuildFiles () {
	name=$(variableInFile "Name" "PKGBUILD")
	folders="pkg src ${name}"
	silently "removeBuildFiles" "rm --recursive --force ${folders}"
}


silently () {
	function="${1}"
	command="${2}"
	error=$(eval "${command}" 2>&1 >"/dev/null")

	if [ ${?} -ne 0 ]; then
		echo "${function}: ${error}" >&2
		exit 1
	fi
}


updateInfoFile () {
	silently "updateInfoFile" "makepkg --printsrcinfo > .SRCINFO"
}


variableInFile () {
	variable="${1}"
	file="${2}"

	echo $(
		source "${file}";
		eval echo \$\{${variable}\}
	)
}


changeToThisProgramDir
mainFunction
