# cranko 0.13.0 (2022-10-02)

- Add the `--pause` option to `cranko cargo foreach-published` (#43, @pkgw). The
  hope is that this will help robustness when publishing a group of crates to
  Crates.io if one of the new releases requires another.

The DOI of this release is [10.5281/zenodo.7135550][cdoi].

[cdoi]: https://doi.org/10.5281/zenodo.7135550


# cranko 0.12.5 (2022-10-02)

- Provide context if the `cargo metadata` command fails, because otherwise the
  error message would be basically uniformative.
- Possibly finally deal with the spurious dirtiness issue on Windows? In my CI
  pipelines, on Windows Cranko would sometimes report the repository as dirty
  when it was not actually. I think that I now mostly understand what's causing
  the problem -- differences in the idea of what Git's index should contain
  based on different line-ending conventions. I haven't figured out a good way
  to wholly prevent the problem in Cranko, but it does seem that it can be
  addressed by adding a simple `.gitattributes` file to a repo. See issue #41 on
  GitHub for further analysis and discussion.

The DOI of this release is [10.5281/zenodo.7133851][cdoi].

[cdoi]: https://doi.org/10.5281/zenodo.7133851


# cranko 0.12.4 (2022-08-15)

- Fix an oversight in the Zenodo monorepo behavior (#39, @pkgw). Before, Cranko
  errored out if the `zenodo preregister` command was being run during a release
  if the project in question was not being released. But the proper thing to do
  here is the same thing as in "development mode": succeed, but use fake DOIs.
  The even more proper thing to do would be to recover the DOI of the most
  recent release and re-use it, but that would be a lot more work to implement
  and I can't think of a non-contrived situation when it would actually make an
  important difference to have the real DOI in place.

The DOI of this release is [10.5281/zenodo.6994431][cdoi].

[cdoi]: https://doi.org/10.5281/zenodo.6994431



# cranko 0.12.3 (2022-08-10)

No code changes from the previous release.

This release will test out Cranko’s support for creating new versions of
existing Zenodo deposits, so that the resulting deposits are linked by
a shared “concept DOI”.

The DOI of this release is [10.5281/zenodo.6981786][cdoi].

[cdoi]: https://doi.org/10.5281/zenodo.6981786


# cranko 0.12.2 (2022-08-10)

Another fix needed on the road to getting Zenodo to work reliably:

- Remove Zenodo HTTP timeouts, because `zenodo update-artifacts` was
  timing out with even modestly-sized uploads (#37, @pkgw).

The DOIs associated with previous releases in the 0.12.x series remain invalid
because their Zenodo publication processes did not complete automatically. (I
could complete it manually, but I want to validate that this process can work
with full automation, and no one's going to use the old artifacts.)

The DOI of this release is [10.5281/zenodo.6981680][cdoi].

[cdoi]: https://doi.org/10.5281/zenodo.6981680


# cranko 0.12.1 (2022-08-10)

The new functionality in the previous release did indeed need a small tweak.

- Fix preconditions of `zenodo update-artifacts` and `zenodo publish` commands:
  they require "release" mode, not "rc" (#36, @pkgw).

The DOIs associated with the 0.12.0 release are not valid because the automated
Zenodo publication step didn't complete. With this fix, hopefully this time it
will.

The DOI of this release is [10.5281/zenodo.6981564][cdoi].

[cdoi]: https://doi.org/10.5281/zenodo.6981564


# cranko 0.12.0 (2022-08-10)

This release of Cranko adds support for safe, automated registration of
software [DOI]s using [Zenodo]!

[DOI]: https://www.doi.org/
[Zenodo]: https://zenodo.org/

While these release notes are not the place to explain in detail why you might
want to register DOIs for your software releases, it's worth spending a few
sentences on the subject. At a nuts-and-bolts level, “depositing” a new software
release with Zenodo is like creating a [GitHub release][ghrel]: you provide
metadata, upload files, and “publish” the package for long-term archiving. The
only important difference is that Zenodo will register a DOI for you. Who cares?
Not everyone! But if you’re an academic, having a DOI makes it possible to “talk
about” your software as a piece of scholarly output, and Zenodo’s publication
process registers information about your software with [Crossref] and the
broader scholarly-publishing information ecosystem. In particular, DOI
registration allows you to associate an author list and [ORCID iDs] with a piece
of software, so you can get credit for your work!

[ghrel]: https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases
[Crossref]: https://www.crossref.org/
[ORCID iDs]: https://orcid.org/

It’s possible to create Zenodo deposits manually, just as it’s possible to
create software releases manually. As ever, the “Cranko perspective” is that
it’s *a total game-changer* to automate these processes. Automation changes
these things from things that happen when you have the time, to things that
“just happen”.

In particular, Cranko’s Zenodo integration provides an incredibly useful piece
of functionality that would be incredibly tedious to implement manually. It uses
Zenodo’s “preregistration” capability to know what DOI your release will have
*before you publish it*, so that your software can *know its own DOI*. You can
use this feature to, for instance, provide a “BibTeX” command that reliably
provides users with the correct citation information for the exact version of
your software that they’re running.

Specifically, at the beginning of your CI/CD pipeline, you can run a new command
`cranko zenodo preregister` that will preregister your Zenodo release — with
sensible behavior for non-release builds. The `preregister` command can rewrite
your source files to insert the preregistered DOI wherever you need it. Once a
release is verified and finalized, you can use `cranko zenodo upload-artifacts`
to associate files with the deposit, and `cranko zenodo publish` to finally
publish it. To set up this support, you need to put a `zenodo.json5` file
somewhere that contains the Zenodo metadata, and export a Zenodo API token in
your CI/CD environment under the name `ZENODO_TOKEN` when needed. See
[the Cranko book][book] for detailed documentation.

[book]: https://pkgw.github.io/cranko/book/latest/

We are still testing out the new workflow with Cranko itself, so it’s possible
that this release will shortly be superseded as we work out the kinks!

The DOI of this release is [10.5281/zenodo.6981389][doi].

[doi]: https://doi.org/10.5281/zenodo.6981389


# cranko 0.11.0 (2022-04-04)

- Add the ability to ignore projects discovered during the autodetection phase.
  Specifically, the `.config/cranko/config.toml` file now supports a
  `projects.$qname.ignore = true` key that does this, [as documented in the
  book][docs]. The ignoring is done in the central configuration file in case
  the autodetected project file is something vendored that you can’t or don’t
  want to modify.

[docs]: https://pkgw.github.io/cranko/book/latest/configuration/


# cranko 0.10.3 (2022-01-14)

No code changes since 0.10.2. Issuing a rebuilt release since the Cranko binary
isn't running on Azure pipelines right now, and I'm wondering if it's an issue
having to do with either the latest version of Rust (1.58) or an update to the
Azure MacOS infrastructure. Either way, it's cheap to make a release, so let's
see if it fixes anything.


# cranko 0.10.2 (2022-01-06)

- Tackle an important `.vdproj` bug. In MSI installers, the `ProductCode` and
  `PackageCode` UUIDs have important semantics that affect the continuity of
  packages across versions. In particular, no two non-identical installers should
  have the same `PackageCode`. So when we rewrite a `.vdproj` file, we need to
  change these fields as well. The current behavior is to generate a new UUID
  on-the-fly and use it to rewrite both the `ProductCode` and `PackageCode`, which
  by my read is a valid, conservative approach. It would be better to have
  the Cranko user provide Cranko with the information needed to allow a bit more
  flexibility, but we'll see how far we can go with this support.

# cranko 0.10.1 (2022-01-04)

- Bugfix `.vdproj` rewriting: the rewritten file should contain only the first
  three terms of the project version. The "revision" isn't supported.


# cranko 0.10.0 (2022-01-04)

- Cranko will now detect `.vdproj` files (Visual Studio setup/installer projects)
  and try to associate them with C# `.csproj` projects. When that can be done, it
  will update the ProductVersion in the installer to track the associated project.
- When rewriting files on Windows, Cranko will now emit them with CRLF line endings.
  Note that this is done unconditionally, without checking the line endings on
  the original file. Before, line endings were unconditionally LF-only on all
  platforms, generating large Git diffs on Windows in standard use cases.


# cranko 0.9.1 (2021-12-29)

- Fix up the C# support to avoid too-big version numbers in .NET development
  versions, which can only go up to 65534.


# cranko 0.9.0 (2021-12-28)

- Add basic support for Visual Studio C# projects, based on reading and writing
  `AssemblyInfo.cs` files. It's quite simplistic but should meet my particular
  need.
- Fix a crash in `cranko confirm` when internal deps are missing (#24).


# cranko 0.8.0 (2021-09-25)

- Add [`cranko diff`], analogous to `git diff` but diffing against the most recent
  release of a project
- Add [`cranko show toposort`] to print out the list of projects in a repo in a
  topologically-sorted order, with regards to intra-repo dependencies.

[`cranko diff`]: https://pkgw.github.io/cranko/book/latest/commands/dev/diff.html
[`cranko show toposort`]: https://pkgw.github.io/cranko/book/latest/commands/util/show.html#cranko-show-toposort


# cranko 0.6.1 (2021-06-03)

When writing out dependencies for pre-1.0 versions in Cargo.toml files, use a
`>=` expression rather than a caret (`^`). Cargo is actually somewhat looser
than strict semver, which says that before 1.0 nothing is guaranteed to be
compatible with anything, but still says that `0.2` is not compatible with
`^0.1`, which is annoyingly strict for our usage. The greater-than expression is
interpreted more liberally.


# cranko 0.6.0 (2021-06-03)

- Add the `cranko show tctag` command. It's a bit silly, but should be convenient.


# cranko 0.5.0 (2021-04-03)

- Add the `cranko log` command
- Ignore merge commits when analyzing the repo history. These usually don't
  provide any extra value.


# cranko 0.4.3 (2021-01-22)

- No code changes; just adding the new YouTube video to the book index page.


# cranko 0.4.2 (2021-01-15)

- Have `cranko stage` honor `--force` in the intuitive way for projects with no
  detected modifications since last release.


# cranko 0.4.1 (2021-01-12)

Fix `apply-versions` for some bootstrapped projects. Due to an oversight, if you
were making the first release of a project that had a bootstrap version assigned
in repo in which other projects had previously been released, the bootstrap
version would be ignored, resulting in an incorrect version assignment. This has
been remedied.


# cranko 0.4.0 (2021-01-07)

Add the command `cranko npm lerna-workaround`. This will temporarily rewrite the
internal version requirements of your NPM projects to exactly match the current
versions of each project in the repo — which seems to be necessary in order for
Lerna to properly understand a repo's internal dependency structure.

The idea is that you can create your release commit, apply these changes, run
your Lerna-based NPM scripts, and then `git restore` to get back to project
files with proper version requirements. Since the internal version requirements
in `package.json` are the only things that are changing, I think this will be a
good-enough workflow.

I don't understand Lerna very well so it's possible that there's a better
solution, but from what I've seen its scheme doesn't play well with Cranko's so
there's only so much we can do.


# cranko 0.3.6 (2021-01-07)

Fix preservation of unreleased changelogs. If you had a monorepo, an oversight
would mean that during the release workflow, the changelogs of unreleased
projects on the release branch would be reset to whatever was on the main
branch. This would erase their changelog contents since the main branch
changelog can just be a placeholder in the Cranko workflow.

Now, the `release-workflow apply-versions` step will copy over the
release-branch changelogs of unreleased projects, so that they will be preserved
unchanged when `release-workflow commit` updates the release branch. In the
typical case that the release workflow process is automated and commits all
outstanding changes to the working tree, this will transparently fix the issue.

If this mistake caused the release changelog of one of your projects to be
overwritten on the release branch, the `cranko stage` command will fail to
populate the project's changelog history during its next release. To fix the
problem, all you have to do is manually re-add the history before running
`cranko confirm`. You can obtain the most recent changelog with the command `git
show $PROJECT_LAST_RELEASE_TAG:$PROJECT_CHANGELOG_PATH`, e.g. `git show
mymodule@1.2.3:mymodule/CHANGELOG.md`.

# cranko 0.3.5 (2021-01-04)

- Allow projects that aren't being released to have "improper" internal
  dependencies in `cranko confirm` and `cranko release-workflow apply-versions`.
  Here, "improper" means that if the project was published, the version
  requirements for its internal dependencies would be incorrect or
  unsatisfiable. Cranko's release model already allowed this in some cases, but
  now it is more widely tolerated. For instance, if you have a monorepo with a
  project A that depends on B and requires a new release of it, you weren't able
  to release B on its own. Now you can.
- Fix `cranko release-workflow commit` for new, unreleased projects. Previously,
  if you added a new project and made a release of a different project, the new
  project would be logged in the release information of the `release` branch.
  But this would make it appear that the new project had actually been released.
  Now, the creation of the release commit info takes into account whether the
  project has been released, or is being released, or not.
- Run `cargo update` to update dependencies.
- Make the code clippy-compliant and add a `cargo clippy` check to the CI.

# cranko 0.3.4 (2020-11-17)

- Document the Python support introduced in 0.3.0, now that it’s had time to
  settle down a little bit.
- No code changes.

# cranko 0.3.3 (2020-10-18)

- Escape most illegal characters when creating Git tag names. Not all illegal
  tags are detected.

# cranko 0.3.2 (2020-10-17)

- Use `.dev` codes for developer codes in PEP440 versions, not `local_identifier`
- Make sure to add a final newline to rewritten `package.json` files
- Python packages can now express cross-system internal dependencies. This
  feature is needed for [pywwt](https://pywwt.readthedocs.io).
- Internal refactorings in support of the above

# cranko 0.3.1 (2020-10-17)

- Python: fix version rewriting when the version is expressed as a tuple

# cranko 0.3.0 (2020-09-28)

- Add a first cut at Python support. Not yet documented or really well tested,
  but let's put out a release so that we can see how it works in CI/CD.

# cranko 0.2.3 (2020-09-24)

- Add some colorful highlighting for `cranko status`
- Add a Concepts reference section and Azure Pipelines integration
  recommendations to the book.
- Have logging fall back to basic stdio if the color-logger doesn't work

# cranko 0.2.2 (2020-09-23)

- No code changes, but update the documentation for the NPM support.

# cranko 0.2.1 (2020-09-23)

- Add `npm install-token` (still not yet documented).

# cranko 0.2.0 (2020-09-23)

- Add a first cut at NPM support.
- Not yet documented or really well tested, but let's put out a release so that
  we can see how it works in CI/CD.

# cranko 0.1.0 (2020-09-20)

- Add `cranko bootstrap` to help people bootstrap Cranko usage in pre-existing
  repositories. I think it should work? In order to give people sensible
  behavior, we add a `bootstrap.toml` file that lets us record "prehistory"
  versions, and also implement a "manual" mode for specifying version
  requirements of internal dependencies so that we can grandfather in whateve
  folks had before.

# cranko 0.0.27 (2020-09-17)

- Start working on the configuration framework, with a per-repository file at
  `.config/cranko/config.toml`. Only a few demonstration options are available
  as of yet.
- Replace the first-draft error handling with what I hope is a better design.
  Still need to go back and start adding helpful context everywhere. Seems like
  a helper macro could potentially be useful.
- Fix some more problems in the CI/CD deployment pipeline.

# cranko 0.0.26 (2020-09-08)

- Fix `cranko stage` when no previous changelog is in the history
- See if we can parallelize deployment tasks in the CI pipeline.

# cranko 0.0.25 (2020-09-07)

- Add `cranko ci-util env-to-file`
- Make the "unsatisfied internal dependency" error message slightly more
  informative.

# cranko 0.0.24 (2020-09-07)

- Add a `--by-tag` mode to `cranko github upload-artifacts`

# cranko 0.0.23 (2020-09-06)

- Add `github create-custom-release` and `github delete-release`. These
  utilities will help with the Tectonic `continuous` release, which I want to
  maintain. But it's important to note that the intent is that in most cases
  you'll want to create releases with `github create-releases` —
  `create-custom-release` is a more specialized tool. And of course, in most
  cases you shouldn't be deleting releases.

# cranko 0.0.22 (2020-09-06)

- Add `cranko show if-released`
- ci: fix Crates.io publishing, hopefully?

# cranko 0.0.21 (2020-09-06)

- No code changes.
- ci: first publication to Crates.io. Hopefully.

# cranko 0.0.20 (2020-09-04)

- Attempt to fix `cranko cargo package-released-binaries` when using the `cross`
  tool in the presence of subprojects. We need to pass a `--package` argument to
  the tool, rather than starting it in a different directory, due to various
  assumptions that get broken when we do the latter.

# cranko 0.0.19 (2020-09-04)

- Try to provide more error context in `cranko cargo package-released-binaries`.

# cranko 0.0.18 (2020-09-03)

- Get `cargo package-released-binaries` working with `cross` by adding
  `--command-name` and `--reroot` options. Definitely hacky, but whatcha gonna
  do.
- With the above in hand, start providing sample prebuilt binaries for
  `aarch64-unknown-linux-gnu` and `powerpc64le-unknown-linux-gnu` as a proof of
  concept. These have not actually been tested in practice, though.

# cranko 0.0.17 (2020-09-01)

- cargo: take the "v" out of the binary package name template -- fixes the
  one-liner installers
- ci: minor tidying

# cranko 0.0.16 (2020-09-01)

- Add `cranko cargo package-released-binaries`
- Refactor CI infrastructure and use the above new command.
- Yet more tuning of the execution-environment code, unbreaking it on pull
  requests and in other contexts.

# cranko 0.0.15 (2020-09-01)

- Oops! Fix the release process when only a subset of packages are being
  released.
- Add a `cargo foreach-released` subcommand
- Tidy up project-graph querying framework and add more features.

# cranko 0.0.14 (2020-08-31)

- Make `--force` actually work for `cranko stage` and `cranko confirm`
- book: a first pass of edits and tidying
- Tidy up some internals that "shouldn't" affect the release pipeline, but I
  want to push a release through to verify that.

# cranko 0.0.13 (2020-08-29)

- Add a bunch of content to the book. (I should start releasing this as project
  separate from the `cranko` crate, but the infrastructure isn’t quite there yet
  …)
- ci: move Windows/GNU to stable instead of nightly

# cranko 0.0.12 (2020-08-28)

- Start working on the book, and wire it up to the GitHub pages site.

# cranko 0.0.10 (2020-08-28)

- Add a draft Windows Powershell install script for CI.

# cranko 0.0.9 (2020-08-27)

- Rename `create-release` to `create-releases`. Still getting into the mindset
  of vectorizing over projects.
- Have `create-releases` be picky about its execution environment. It should
  only be run on a checkout of `release` triggered by an update to `rc`.

# cranko 0.0.8 (2020-08-27)

- Add the "force X.Y.Z" version-bump scheme

# cranko 0.0.7 (2020-08-27)

- Add `cranko git-util reboot-branch`
- Start working on stubbing out a GitHub Pages site to host instant-install
  commands for use in CI pipelines. If I've done this right, this release should
  demonstrate the basic workflow.

# cranko 0.0.6 (2020-08-26)

- Try to get internal dependencies working. The most very basic tests don't
  crash. The code feels quite messy.

# cranko 0.0.5 (2020-08-23)

- Add `github install-credential-helper` and hidden support command `github
  _credential-helper`; this release will help check whether they actually work!

# cranko 0.0.4 (2020-08-23)

- Fix up the analysis of release histories to work properly when projects are not
  all released in lockstep. (I hope. Not yet tested.)
- Fix up checking for repository dirtiness in the stage/confirm workflow: modified
  changelogs should be ignore.
- Lots of general polish to the stage/confirm UX
- Infrastructure: try to simplify/clarify CI pipeline logic with conditionals on
  template parameters

# cranko 0.0.3 (2020-08-22)

- Split `apply` into two separate steps, subcommands of a new `release-workflow`
  command along with `tag`.

# cranko 0.0.2 (2020-08-22)

- Add `github` subcommand with some useful utilities
- Wire those up in the Cranko CI/CD pipeline
- Add logging infrastructure and start making the CLI UI nicer
- Work on adding a few more consistency checks
- Fix changelog updating scheme

# Version 0.0.1 (2020-08-19)

Attempt to publish 0.0.1!
