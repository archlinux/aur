# Change Log

## [Unreleased]
Nothing to report...

## [2.01] - 2016.08.16
### **Fixes**
- Forgot module in `sshprint` script

## [2.00] - 2016.08.16
### **Major Changes**
- Moved from ZSH to Perl (see PERL_README.md for why)
  - because of this, users are advised to remove the previous version of
    `sshprint`.
- Version number changed from semantic version to Perl's versioning convention
  - Dropped the `beta' postfix from the version number
- Started using some modules, like Config::Simple and Net::OpenSSH to deal with
  accessing configurations and handling SSH connections respectively.

### **Known Problems**
- Currently untested (there are likely to be teething problems)

### **Still to do**
- PERL opens up the possibility for better cohesion of subroutines and a bit of
  OOP as well. What this means is that I can drop most of my global variables
  and stick to loosely coupled functions. My intent is to create a script for
  use with the CUPS server directly.

## [1.6.3] - 2016.06.28
### Fixed
- Fix regex in select printer dialog.

[Unreleased]: https://github.com/hv15/sshprint/compare/2.00...HEAD
[2.01]: https://github.com/hv15/sshprint/compare/2.00...2.01
[2.00]: https://github.com/hv15/sshprint/compare/1.6.3-beta...2.00
[1.6.3]: https://github.com/hv15/sshprint/compare/1.6.2-beta...1.6.3-beta
