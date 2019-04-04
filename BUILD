#! /bin/bash


mainFunction () {
	updateInfoFile
	buildPackage
}


buildPackage () {
	removeBuildFiles
	execute "buildPackage" "makepkg --force"
	removeBuildFiles
}


changeToThisProgramDir () {
	cd "$( dirname "${BASH_SOURCE[0]}" )"
}


execute () {
	function="${1}"
	command="${2}"
    error=$(eval "${command}" 2>&1 >"/dev/null")

    if [ ${?} -ne 0 ]; then
        echo "${function}: ${error}" >&2
        exit 1
    fi
}


removeBuildFiles () {
	source PKGBUILD
	folders="pkg src ${name}"
	execute "removeBuildFiles" "rm --recursive --force ${folders}"
}


updateInfoFile () {
	execute "updateInfoFile" "makepkg --printsrcinfo > .SRCINFO"
}


changeToThisProgramDir
mainFunction
