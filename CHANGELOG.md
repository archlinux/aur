# [v1.4.7 - 2017-10-20](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.6)

## Added

- Added context menu actions to apply, pop, and drop stashes.

## Fixed

- Fixed issues related to revert and cherry-pick that result in a conflict.
- Fixed merge abort menu item to update more consistently.

# [v1.4.6 - 2017-10-17](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.5)

## Added

- Added advanced option to specify a custom URL for hosting providers.

## Fixed

- Fixed failure to execute pre-push hook (including LFS) in some cases.
- Fixed error messages on console.

# [v1.4.5 - 2017-10-10](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.4)

## Added

- Added option to merge without committing.
- Added context menu actions to stage/unstage multiple files at once.

## Fixed

- Fixed usability issues in the custom external tools editor interface.
- Don't yield focus to the commit message editor when staging files with the keyboard.
- Fixed state of stash toolbar button and menu item when the working directory is clean except for untracked files.
- Fixed failure to cherry-pick and revert when the working directory is dirty.
- Fixed hang on some diffs.
- Fixed garbage remote transfer rate when the elapsed time is too small to measure.
- (Mac) Fixed several issues on macOS 10.13.

# [v1.4.4 - 2017-09-22](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.3)

## Added

- Style editor content after saving a new file.

## Fixed

- Fixed style of tag reference badges that point to the HEAD.
- Fixed regression in showing images in the diff area.
- Fixed regression in indexing by lexical class.
- (Win) Fixed regression in staging "exectuable" files.

# [v1.4.3 - 2017-09-15](https://gitahead.com/cgi-bin/update.py?platform=linux&version=1.4.2)

## Added

- Added reference badge for the detached HEAD state.
- Added commit list context menu item to rebase a specific commit.
- Added remote branch context menu item to create a new local branch that tracks the remote branch.

## Fixed

- Fixed bugs in staging file mode changes.
- Fixed failure to look up the correct host name for SSH URLs that use an alias from the SSH config file.

## Changed

- Start indexer process with lower priority.
